---
created: 2026-03-03
tags: [#学习笔记, #python, #语法]
source:
status: 进行中
---

# Python 基础语法

## 核心概念

Python 是一种高级、解释型、动态类型的编程语言。以下是基础语法的核心概念：

### 1. 变量与赋值
- **变量**：无需声明类型，直接赋值即可创建
- **赋值运算符**：`=` 用于给变量赋值
- **命名规则**：字母、数字、下划线组成，不能以数字开头

### 2. 基本数据类型
- **数值类型**：`int`（整数）、`float`（浮点数）、`complex`（复数）
- **布尔类型**：`bool`（True/False）
- **字符串**：`str`，用单引号或双引号表示
- **空值**：`None` 表示空值或无值

### 3. 数据结构
- **列表（List）**：有序、可变的序列 `[1, 2, 3]`
- **元组（Tuple）**：有序、不可变的序列 `(1, 2, 3)`
- **字典（Dictionary）**：键值对集合 `{'key': 'value'}`
- **集合（Set）**：无序、不重复的元素集合 `{1, 2, 3}`

### 4. 控制流
- **条件语句**：`if`、`elif`、`else`
- **循环语句**：`for` 循环、`while` 循环
- **循环控制**：`break`、`continue`、`pass`

### 5. 函数
- **定义**：使用 `def` 关键字
- **参数**：位置参数、默认参数、可变参数
- **返回值**：使用 `return` 语句

### 6. 输入输出
- **输入**：`input()` 函数
- **输出**：`print()` 函数

## 关键要点

1. **动态类型系统**：Python 是动态类型语言，变量类型在运行时确定，无需显式声明
2. **缩进即语法**：Python 使用缩进来表示代码块，而不是大括号 `{}`
3. **一切皆对象**：Python 中所有数据都是对象，包括函数和类
4. **简洁的语法**：Python 语法简洁明了，强调可读性
5. **丰富的内置数据结构**：列表、字典、元组、集合等数据结构使用方便
6. **强大的标准库**：Python 自带"电池"，包含大量实用的模块和功能

## 代码示例

### 1. 变量与基本数据类型
```python
# 变量赋值
name = "Python"
version = 3.9
is_awesome = True

# 基本数据类型
integer_num = 42           # int
float_num = 3.14           # float
complex_num = 2 + 3j       # complex
text = "Hello, World!"     # str
nothing = None             # NoneType

print(f"Language: {name}, Version: {version}")
print(f"Is awesome? {is_awesome}")
```

### 2. 数据结构
```python
# 列表 - 有序、可变
fruits = ["apple", "banana", "cherry"]
fruits.append("orange")
print(f"Fruits: {fruits}")

# 元组 - 有序、不可变
coordinates = (10, 20)
print(f"Coordinates: {coordinates}")

# 字典 - 键值对
person = {"name": "Alice", "age": 30, "city": "New York"}
print(f"Person: {person['name']}, Age: {person['age']}")

# 集合 - 无序、不重复
unique_numbers = {1, 2, 3, 3, 2, 1}
print(f"Unique numbers: {unique_numbers}")
```

### 3. 控制流
```python
# 条件语句
age = 18
if age < 13:
    print("Child")
elif age < 20:
    print("Teenager")
else:
    print("Adult")

# for 循环
for i in range(5):
    print(f"Number: {i}")

# while 循环
count = 0
while count < 3:
    print(f"Count: {count}")
    count += 1
```

### 4. 函数
```python
# 函数定义
def greet(name, greeting="Hello"):
    """返回问候语"""
    return f"{greeting}, {name}!"

# 函数调用
message = greet("Python Learner")
print(message)

# 带默认参数的函数
def calculate_area(length, width=1):
    return length * width

area = calculate_area(5, 3)
print(f"Area: {area}")
```

### 5. 列表推导式（Pythonic 写法）
```python
# 传统方式
squares = []
for x in range(10):
    squares.append(x**2)

# 列表推导式
squares = [x**2 for x in range(10)]
even_squares = [x**2 for x in range(10) if x % 2 == 0]

print(f"Squares: {squares}")
print(f"Even squares: {even_squares}")
```

## 我的理解

通过学习 Python 基础语法，我有以下理解：

### Python 的设计哲学
- **简洁优雅**：Python 语法非常简洁，减少了不必要的语法元素
- **强调可读性**："Pythonic" 代码强调可读性和简洁性
- **快速上手**：相比其他语言，Python 入门门槛较低

### 与其他语言的对比
- **与 Java/C++ 对比**：无需声明变量类型，语法更简洁
- **与 JavaScript 对比**：缩进代替大括号，强制良好的代码格式
- **与 Go 对比**：动态类型 vs 静态类型，各有优劣

### 实际应用感受
- **开发效率高**：Python 的简洁语法让快速原型开发成为可能
- **学习曲线平缓**：基础语法容易掌握，适合编程初学者
- **社区生态丰富**：Python 有庞大的社区和丰富的第三方库

### 需要注意的点
- **缩进敏感**：必须严格保持一致的缩进，否则会报错
- **动态类型的双刃剑**：灵活但可能隐藏类型错误
- **性能考虑**：解释型语言，性能不如编译型语言

## 待深入

以下是我计划进一步学习的 Python 主题：

### 1. 面向对象编程
- [ ] 类的定义和使用
- [ ] 继承、多态、封装
- [ ] 特殊方法（`__init__`, `__str__` 等）
- [ ] 属性装饰器（`@property`）

### 2. 高级特性
- [ ] 装饰器（Decorators）
- [ ] 生成器（Generators）和 yield
- [ ] 上下文管理器（Context Managers）
- [ ] 元类（Metaclasses）

### 3. 错误处理
- [ ] 异常处理（try/except/finally）
- [ ] 自定义异常类
- [ ] 异常链

### 4. 模块和包
- [ ] 模块的导入和使用
- [ ] 包的创建和组织
- [ ] `__init__.py` 文件的作用
- [ ] 相对导入和绝对导入

### 5. 标准库深入
- [ ] `collections` 模块
- [ ] `itertools` 模块
- [ ] `functools` 模块
- [ ] `datetime` 模块

### 6. 并发编程
- [ ] 多线程（`threading`）
- [ ] 多进程（`multiprocessing`）
- [ ] 异步编程（`asyncio`）

## 参考链接

### 官方文档
- [Python 官方文档](https://docs.python.org/3/) - 最权威的 Python 文档
- [Python 教程](https://docs.python.org/3/tutorial/) - 官方入门教程

### 在线教程
- [W3Schools Python 教程](https://www.w3schools.com/python/) - 交互式学习
- [菜鸟教程 Python3](https://www.runoob.com/python3/python3-tutorial.html) - 中文教程
- [Real Python](https://realpython.com/) - 高质量的 Python 教程

### 视频课程
- [Python for Everybody](https://www.py4e.com/) - 密歇根大学的免费课程
- [Corey Schafer 的 Python 教程](https://www.youtube.com/playlist?list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7) - YouTube 优质教程

### 书籍推荐
- 《Python 编程：从入门到实践》- 适合初学者
- 《流畅的 Python》- 深入理解 Python 特性
- 《Effective Python》- Python 最佳实践

### 练习平台
- [LeetCode Python 练习](https://leetcode.com/problemset/all/?topicSlugs=array) - 算法练习
- [HackerRank Python 练习](https://www.hackerrank.com/domains/python) - 编程挑战
- [Codewars Python Kata](https://www.codewars.com/?language=python) - 编程挑战

### 相关笔记链接
- [[Python 装饰器详解]] - 待创建
- [[Python 面向对象编程]] - 待创建
- [[Python 标准库常用模块]] - 待创建