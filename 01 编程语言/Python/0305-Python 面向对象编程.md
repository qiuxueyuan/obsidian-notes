---
created: 2026-03-05
tags: [#学习笔记, #python, #面向对象]
source:
status: 进行中
---

# Python 面向对象编程

## 核心概念

面向对象编程（OOP）是一种编程范式，使用"对象"来设计应用程序和软件。Python 完全支持 OOP。

### 1. 类（Class）与对象（Object）
- **类**：对象的蓝图或模板，定义对象的属性和方法
- **对象**：类的实例，具有类定义的属性和方法

### 2. 四大支柱
- **封装（Encapsulation）**：将数据和方法包装在类中，隐藏内部实现细节
- **继承（Inheritance）**：子类继承父类的属性和方法，实现代码复用
- **多态（Polymorphism）**：不同类的对象对同一消息做出不同的响应
- **抽象（Abstraction）**：隐藏复杂细节，只暴露必要的接口

### 3. 关键概念
- **属性（Attributes）**：对象的数据/状态
- **方法（Methods）**：对象的行为/功能
- **构造函数（`__init__`）**：对象初始化时调用的特殊方法
- **实例属性 vs 类属性**：实例特有的 vs 类共享的属性
- **实例方法 vs 类方法 vs 静态方法**：不同类型的方法

## 关键要点

1. **Python 中一切皆对象**：包括函数、类、模块都是对象
2. **`self` 参数**：实例方法的第一个参数，指向对象本身
3. **特殊方法（Dunder Methods）**：以双下划线开头和结尾的方法，如 `__init__`、`__str__`
4. **属性访问控制**：Python 没有严格的私有属性，但使用命名约定（`_name`、`__name`）
5. **多重继承**：Python 支持多重继承，但需谨慎使用
6. **Mixin 模式**：使用多重继承实现代码复用的一种方式

## 代码示例

### 1. 基本类定义
```python
class Dog:
    """狗类示例"""

    # 类属性（所有实例共享）
    species = "Canis familiaris"

    def __init__(self, name, age):
        """初始化方法"""
        # 实例属性（每个实例独有）
        self.name = name
        self.age = age

    def bark(self):
        """实例方法"""
        return f"{self.name} says: Woof!"

    def get_info(self):
        """返回狗的信息"""
        return f"{self.name} is {self.age} years old"

# 创建对象
dog1 = Dog("Buddy", 3)
dog2 = Dog("Max", 5)

print(dog1.bark())          # Buddy says: Woof!
print(dog2.get_info())      # Max is 5 years old
print(f"Species: {Dog.species}")  # 访问类属性
```

### 2. 继承示例
```python
class Animal:
    """动物基类"""

    def __init__(self, name):
        self.name = name

    def speak(self):
        raise NotImplementedError("子类必须实现此方法")

class Cat(Animal):
    """猫类，继承自动物"""

    def speak(self):
        return f"{self.name} says: Meow!"

    def purr(self):
        return f"{self.name} is purring..."

class Dog(Animal):
    """狗类，继承自动物"""

    def speak(self):
        return f"{self.name} says: Woof!"

    def fetch(self, item):
        return f"{self.name} fetched the {item}"

# 多态演示
animals = [Cat("Whiskers"), Dog("Rex")]

for animal in animals:
    print(animal.speak())  # 同一接口，不同实现
```

### 3. 特殊方法和属性访问
```python
class BankAccount:
    """银行账户类"""

    def __init__(self, owner, balance=0):
        self.owner = owner
        self._balance = balance  # 受保护属性

    def __str__(self):
        """字符串表示"""
        return f"BankAccount(owner={self.owner}, balance={self._balance})"

    def __repr__(self):
        """官方字符串表示"""
        return f"BankAccount('{self.owner}', {self._balance})"

    def deposit(self, amount):
        """存款"""
        if amount > 0:
            self._balance += amount
            return True
        return False

    def withdraw(self, amount):
        """取款"""
        if 0 < amount <= self._balance:
            self._balance -= amount
            return True
        return False

    @property
    def balance(self):
        """余额属性（只读）"""
        return self._balance

# 使用示例
account = BankAccount("Alice", 1000)
print(account)              # 调用 __str__
print(repr(account))        # 调用 __repr__

account.deposit(500)
print(f"Balance: {account.balance}")  # 使用属性装饰器
```

### 4. 类方法和静态方法
```python
class TemperatureConverter:
    """温度转换器"""

    @staticmethod
    def celsius_to_fahrenheit(celsius):
        """摄氏转华氏（静态方法）"""
        return (celsius * 9/5) + 32

    @staticmethod
    def fahrenheit_to_celsius(fahrenheit):
        """华氏转摄氏（静态方法）"""
        return (fahrenheit - 32) * 5/9

    @classmethod
    def from_string(cls, temp_str):
        """从字符串创建转换器（类方法）"""
        value, unit = temp_str.split()
        value = float(value)

        if unit.upper() == 'C':
            return cls(value, 'C')
        elif unit.upper() == 'F':
            return cls(value, 'F')
        else:
            raise ValueError("Invalid temperature unit")

    def __init__(self, value, unit='C'):
        self.value = value
        self.unit = unit

    def convert(self, to_unit):
        """转换温度"""
        if self.unit == to_unit:
            return self.value

        if self.unit == 'C' and to_unit == 'F':
            return self.celsius_to_fahrenheit(self.value)
        elif self.unit == 'F' and to_unit == 'C':
            return self.fahrenheit_to_celsius(self.value)
        else:
            raise ValueError("Unsupported conversion")

# 使用示例
print(f"25°C = {TemperatureConverter.celsius_to_fahrenheit(25):.1f}°F")

converter = TemperatureConverter.from_string("77 F")
print(f"77°F = {converter.convert('C'):.1f}°C")
```

## 我的理解

### Python OOP 的特点
1. **灵活的面向对象**：Python 支持 OOP，但不强制使用，可以混合使用过程式和面向对象风格
2. **动态特性**：可以在运行时修改类和对象，添加/删除属性和方法
3. **鸭子类型**："如果它走起来像鸭子，叫起来像鸭子，那么它就是鸭子" - 关注对象的行为而非类型

### 与其他语言 OOP 的对比
- **与 Java 对比**：Python 没有接口（interface）概念，使用抽象基类（ABC）或鸭子类型
- **与 C++ 对比**：Python 没有严格的访问控制（public/private/protected）
- **与 JavaScript 对比**：Python 基于类的 OOP vs JavaScript 基于原型的 OOP

### Python OOP 的最佳实践
1. **优先使用组合而非继承**：除非有明显的"is-a"关系，否则使用组合
2. **使用属性装饰器**：将方法转换为属性，提供更自然的接口
3. **合理使用特殊方法**：实现 `__str__`、`__repr__` 等提高代码可读性
4. **避免过度设计**：Python 强调简洁，不要为了 OOP 而 OOP

### 实际应用价值
- **代码组织**：OOP 帮助组织复杂代码，提高可维护性
- **代码复用**：通过继承和组合实现代码复用
- **团队协作**：清晰的类接口便于团队协作开发
- **框架开发**：大多数 Python 框架（如 Django、Flask）都使用 OOP 设计

## 待深入

### 1. 高级 OOP 概念
- [ ] 抽象基类（ABC）和 `abc` 模块
- [ ] 描述符（Descriptors）和属性控制
- [ ] 元类（Metaclasses）和类创建过程
- [ ] 混入类（Mixin）的设计模式

### 2. 设计模式
- [ ] 工厂模式（Factory Pattern）
- [ ] 单例模式（Singleton Pattern）
- [ ] 观察者模式（Observer Pattern）
- [ ] 策略模式（Strategy Pattern）

### 3. 特殊方法深入
- [ ] 比较相关方法（`__eq__`, `__lt__`, `__hash__`）
- [ ] 容器相关方法（`__len__`, `__getitem__`, `__setitem__`）
- [ ] 可调用对象（`__call__`）
- [ ] 上下文管理器（`__enter__`, `__exit__`）

### 4. 属性管理
- [ ] `@property`、`@setter`、`@deleter` 装饰器
- [ ] `__getattr__` 和 `__getattribute__` 的区别
- [ ] 属性描述符（property descriptors）
- [ ] 使用 `__slots__` 优化内存

### 5. 继承和多态进阶
- [ ] 方法解析顺序（MRO）和 `super()` 函数
- [ ] 多重继承的钻石问题
- [ ] 接口隔离和依赖倒置原则
- [ ] 组合与继承的选择

## 参考链接

### 官方文档
- [Python 类文档](https://docs.python.org/3/tutorial/classes.html) - 官方类教程
- [Python 数据模型](https://docs.python.org/3/reference/datamodel.html) - 特殊方法文档

### 在线教程
- [Real Python: OOP](https://realpython.com/python3-object-oriented-programming/) - 高质量的 OOP 教程
- [Python OOP 教程](https://www.programiz.com/python-programming/object-oriented-programming) - 交互式学习
- [GeeksforGeeks Python OOP](https://www.geeksforgeeks.org/python-oops-concepts/) - 概念详解

### 视频课程
- [Corey Schafer: Python OOP](https://www.youtube.com/playlist?list=PL-osiE80TeTsqhIuOqKhwlXsIBIdSeYtc) - YouTube 优质教程
- [Python OOP 完整课程](https://www.youtube.com/watch?v=ZDa-Z5JzLYM) - 免费完整课程

### 书籍推荐
- 《Python 面向对象编程》- 专门讲解 Python OOP
- 《流畅的 Python》第 5-9 章 - 深入讲解 Python 数据模型
- 《Effective Python》第 4 章 - OOP 最佳实践

### 相关笔记链接
- [[Python/0303-Python 基础语法]] - 基础语法笔记
- [[Python 装饰器详解]] - 待创建（与属性装饰器相关）
- [[Python 设计模式]] - 待创建
- [[Python 特殊方法详解]] - 待创建