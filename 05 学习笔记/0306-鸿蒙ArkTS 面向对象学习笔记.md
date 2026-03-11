---
created: 2026-03-09
tags: [#学习笔记, #鸿蒙, #ArkTS, #面向对象, #TypeScript]
source: https://developer.harmonyos.com/cn/docs/documentation/doc-guides/arkts-oop-0000001821000049
status: 进行中
---

# 鸿蒙ArkTS 面向对象学习笔记

## 核心概念

**ArkTS** 是鸿蒙生态的应用开发语言，基于 TypeScript 扩展，支持声明式 UI 和状态管理。

| 概念 | 说明 |
|------|------|
| **类 (Class)** | ArkTS 中的基本面向对象单元，包含属性和方法 |
| **对象 (Object)** | 类的实例，具有具体的属性和行为 |
| **继承 (Inheritance)** | 子类继承父类的属性和方法，实现代码复用 |
| **封装 (Encapsulation)** | 隐藏内部实现细节，提供公共接口 |
| **多态 (Polymorphism)** | 同一接口在不同类中有不同实现 |
| **接口 (Interface)** | 定义契约，规定类必须实现的方法 |
| **抽象类 (Abstract Class)** | 不能实例化，用于定义通用行为 |

## 关键要点

1. **ArkTS 与 TypeScript 的关系**
   - ArkTS 是 TypeScript 的超集，完全兼容 TS 语法
   - 增加了鸿蒙特有的声明式 UI 语法和状态管理
   - 支持静态类型检查，提高代码质量

2. **类的定义与使用**
   - 使用 `class` 关键字定义类
   - 支持构造函数、属性、方法
   - 支持访问修饰符（public、private、protected）

3. **继承机制**
   - 使用 `extends` 关键字实现继承
   - 支持方法重写（override）
   - 支持 `super` 关键字调用父类方法

4. **接口与抽象类**
   - 接口定义契约，使用 `interface` 关键字
   - 抽象类使用 `abstract` 关键字
   - 类可以实现多个接口，但只能继承一个父类

## 代码示例

```typescript
// ==================== 基本类定义 ====================

// 定义一个 Person 类
class Person {
  // 属性
  name: string;
  age: number;

  // 构造函数
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  // 方法
  introduce(): string {
    return `我叫${this.name}，今年${this.age}岁`;
  }

  // 静态方法
  static createDefault(): Person {
    return new Person("匿名", 18);
  }
}

// 使用类
let person1 = new Person("张三", 25);
console.log(person1.introduce()); // 我叫张三，今年25岁

let defaultPerson = Person.createDefault();
console.log(defaultPerson.introduce()); // 我叫匿名，今年18岁


// ==================== 继承 ====================

// 父类
class Animal {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  makeSound(): string {
    return "动物发出声音";
  }
}

// 子类继承父类
class Dog extends Animal {
  breed: string;

  constructor(name: string, breed: string) {
    super(name); // 调用父类构造函数
    this.breed = breed;
  }

  // 方法重写
  override makeSound(): string {
    return `${this.name}汪汪叫`;
  }

  // 子类特有方法
  fetch(): string {
    return `${this.name}去捡球`;
  }
}

// 使用继承
let dog = new Dog("旺财", "金毛");
console.log(dog.makeSound()); // 旺财汪汪叫
console.log(dog.fetch()); // 旺财去捡球


// ==================== 接口 ====================

// 定义接口
interface Drawable {
  draw(): void;
  color: string;
}

interface Resizable {
  resize(width: number, height: number): void;
}

// 类实现接口
class Rectangle implements Drawable, Resizable {
  color: string;
  width: number;
  height: number;

  constructor(color: string, width: number, height: number) {
    this.color = color;
    this.width = width;
    this.height = height;
  }

  draw(): void {
    console.log(`绘制${this.color}的矩形，尺寸：${this.width}x${this.height}`);
  }

  resize(width: number, height: number): void {
    this.width = width;
    this.height = height;
    console.log(`调整尺寸为：${width}x${height}`);
  }
}

// 使用接口
let rect = new Rectangle("红色", 100, 50);
rect.draw();
rect.resize(150, 75);


// ==================== 抽象类 ====================

// 抽象类
abstract class Shape {
  abstract area(): number; // 抽象方法

  // 具体方法
  describe(): string {
    return `这是一个形状，面积：${this.area()}`;
  }
}

// 具体类继承抽象类
class Circle extends Shape {
  radius: number;

  constructor(radius: number) {
    super();
    this.radius = radius;
  }

  // 实现抽象方法
  area(): number {
    return Math.PI * this.radius * this.radius;
  }
}

// 使用抽象类
let circle = new Circle(5);
console.log(circle.describe()); // 这是一个形状，面积：78.53981633974483


// ==================== 访问修饰符 ====================

class BankAccount {
  // 公共属性
  public accountNumber: string;

  // 私有属性（只能在类内部访问）
  private _balance: number;

  // 受保护属性（只能在类内部和子类中访问）
  protected owner: string;

  constructor(accountNumber: string, balance: number, owner: string) {
    this.accountNumber = accountNumber;
    this._balance = balance;
    this.owner = owner;
  }

  // 公共方法
  public deposit(amount: number): void {
    if (amount > 0) {
      this._balance += amount;
      console.log(`存款成功，当前余额：${this._balance}`);
    }
  }

  // 私有方法
  private validateAmount(amount: number): boolean {
    return amount > 0;
  }

  // Getter 方法
  public get balance(): number {
    return this._balance;
  }
}

// 使用访问修饰符
let account = new BankAccount("123456", 1000, "张三");
account.deposit(500); // 存款成功，当前余额：1500
console.log(account.balance); // 1500
// account._balance = 2000; // 错误：私有属性不能在类外部访问


// ==================== 鸿蒙 ArkTS 特有语法 ====================

// 组件类（鸿蒙 ArkUI）
@Component
struct MyComponent {
  // 状态变量
  @State count: number = 0;

  // 构建函数
  build() {
    Column() {
      Text(`计数：${this.count}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Button('增加')
        .onClick(() => {
          this.count++;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

// 自定义组件
@Component
export struct CustomButton {
  // 参数
  @Prop label: string = '按钮';
  @Prop onTap: () => void = () => {};

  build() {
    Button(this.label)
      .onClick(() => {
        this.onTap();
      })
      .backgroundColor(Color.Blue)
      .fontColor(Color.White)
  }
}
```

## 我的理解

ArkTS 的面向对象特性基于 TypeScript，具有以下特点：

1. **类型安全**：静态类型检查可以在编译时发现错误，提高代码质量
2. **现代语法**：支持类、接口、泛型等现代语言特性
3. **鸿蒙集成**：与鸿蒙的声明式 UI 框架深度集成
4. **工程友好**：支持模块化、命名空间等工程化特性

**面向对象在鸿蒙开发中的价值**：
- **组件化开发**：每个 UI 组件都是一个类，便于复用和维护
- **状态管理**：通过类的属性和方法管理组件状态
- **生命周期**：利用类的构造函数和析构函数管理资源
- **继承体系**：构建复杂的 UI 组件继承关系

## 待深入

- [ ] ArkTS 泛型编程
- [ ] 装饰器（Decorator）在 ArkTS 中的应用
- [ ] 模块化与命名空间
- [ ] 异步编程（Promise、async/await）
- [ ] 鸿蒙 ArkUI 组件继承体系
- [ ] 状态管理与数据绑定
- [ ] 自定义组件开发最佳实践

## 参考链接

- [鸿蒙 ArkTS 官方文档](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/arkts-oop-0000001821000049)
- [TypeScript 官方文档](https://www.typescriptlang.org/docs/)
- [鸿蒙 ArkUI 开发指南](https://developer.harmonyos.com/cn/docs/documentation/doc-guides/arkui-get-started-0000001820880065)
- [[01 编程语言]] - 相关编程语言学习资料
- [[02 框架工具]] - 相关开发工具