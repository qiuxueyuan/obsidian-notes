---
created: 2026-03-05
tags: [#学习笔记, #鸿蒙, #ArkTS, #基础]
source:
status: 进行中
---

# 鸿蒙 ArkTS 基础语法学习笔记

## 📚 今日学习目标

**学习时间**：2026年3月5日
**学习主题**：ArkTS 基础语法入门
**预计时长**：2-3小时
**学习成果**：掌握 ArkTS 基本语法，能编写简单的鸿蒙应用

## 🎯 学习路线图（由浅入深）

### 第一阶段：基础入门（今日）
1. **环境准备**：安装 DevEco Studio
2. **语法基础**：变量、数据类型、运算符
3. **流程控制**：条件语句、循环语句
4. **函数使用**：函数定义和调用
5. **实战练习**：编写第一个 ArkTS 程序

### 第二阶段：进阶学习（后续）
1. **面向对象**：类、接口、继承
2. **异步编程**：Promise、async/await
3. **模块化**：导入导出、包管理
4. **类型系统**：泛型、类型守卫
5. **高级特性**：装饰器、元编程

### 第三阶段：项目实战
1. **UI 开发**：ArkUI 组件使用
2. **状态管理**：应用状态管理
3. **网络请求**：HTTP 客户端使用
4. **数据存储**：本地存储方案
5. **项目部署**：应用打包发布

## 📝 今日学习内容

### 1. 环境准备检查
在开始学习前，请确保已完成以下准备：

- [ ] **安装 DevEco Studio**：从华为开发者官网下载并安装
- [ ] **配置开发环境**：安装必要的 SDK 和工具链
- [ ] **创建测试项目**：新建一个空的鸿蒙应用项目
- [ ] **运行模拟器**：启动鸿蒙设备模拟器

### 2. ArkTS 语法基础

#### 2.1 变量声明
```typescript
// 1. 使用 let 声明可变变量
let userName: string = "鸿蒙开发者";
let age: number = 25;
let isLearning: boolean = true;

// 2. 使用 const 声明常量
const PI: number = 3.14159;
const APP_NAME: string = "我的鸿蒙应用";

// 3. 类型推断（TypeScript 特性）
let message = "Hello, HarmonyOS!";  // 自动推断为 string 类型
let score = 100;                    // 自动推断为 number 类型

// 4. 变量命名规范
// - 使用驼峰命名法：myVariableName
// - 常量使用全大写：MAX_SIZE
// - 避免使用保留字
```

#### 2.2 基本数据类型
```typescript
// 1. 数字类型（number）
let integer: number = 42;
let float: number = 3.14;
let hex: number = 0xFF;      // 十六进制
let binary: number = 0b1010; // 二进制

// 2. 字符串类型（string）
let singleQuote: string = '单引号字符串';
let doubleQuote: string = "双引号字符串";
let template: string = `模板字符串，可以嵌入变量：${userName}`;

// 3. 布尔类型（boolean）
let isTrue: boolean = true;
let isFalse: boolean = false;

// 4. 数组类型（Array）
let numbers: number[] = [1, 2, 3, 4, 5];
let strings: Array<string> = ["苹果", "香蕉", "橙子"];

// 5. 元组类型（Tuple）
let person: [string, number] = ["张三", 30];

// 6. 枚举类型（Enum）
enum Color {
  Red = "红色",
  Green = "绿色",
  Blue = "蓝色"
}
let myColor: Color = Color.Red;

// 7. 任意类型（any） - 谨慎使用
let anything: any = "可以是任意类型";
anything = 123;
anything = true;

// 8. 空类型（void、null、undefined）
function logMessage(): void {
  console.log("这个函数没有返回值");
}
let emptyValue: null = null;
let notDefined: undefined = undefined;
```

#### 2.3 运算符
```typescript
// 1. 算术运算符
let a: number = 10;
let b: number = 3;
let sum = a + b;      // 13
let difference = a - b; // 7
let product = a * b;   // 30
let quotient = a / b;  // 3.333...
let remainder = a % b; // 1

// 2. 比较运算符
let isEqual = (a == b);      // false
let isStrictEqual = (a === 10); // true
let isNotEqual = (a != b);   // true
let isGreater = (a > b);     // true
let isLess = (a < b);        // false

// 3. 逻辑运算符
let x: boolean = true;
let y: boolean = false;
let andResult = x && y;  // false
let orResult = x || y;   // true
let notResult = !x;      // false

// 4. 赋值运算符
let count = 0;
count += 5;   // count = count + 5
count -= 2;   // count = count - 2
count *= 3;   // count = count * 3
count /= 2;   // count = count / 2
```

### 3. 流程控制

#### 3.1 条件语句
```typescript
// 1. if-else 语句
let temperature: number = 25;

if (temperature > 30) {
  console.log("天气很热");
} else if (temperature > 20) {
  console.log("天气温暖");
} else if (temperature > 10) {
  console.log("天气凉爽");
} else {
  console.log("天气寒冷");
}

// 2. switch 语句
let day: number = 3;
let dayName: string;

switch (day) {
  case 1:
    dayName = "星期一";
    break;
  case 2:
    dayName = "星期二";
    break;
  case 3:
    dayName = "星期三";
    break;
  case 4:
    dayName = "星期四";
    break;
  case 5:
    dayName = "星期五";
    break;
  default:
    dayName = "周末";
}

console.log(`今天是${dayName}`);

// 3. 三元运算符
let score: number = 85;
let result: string = score >= 60 ? "及格" : "不及格";
console.log(`考试成绩：${result}`);
```

#### 3.2 循环语句
```typescript
// 1. for 循环
console.log("=== for 循环示例 ===");
for (let i = 0; i < 5; i++) {
  console.log(`循环次数：${i + 1}`);
}

// 2. for...of 循环（遍历数组）
let fruits: string[] = ["苹果", "香蕉", "橙子", "葡萄"];
console.log("=== for...of 循环示例 ===");
for (let fruit of fruits) {
  console.log(`水果：${fruit}`);
}

// 3. for...in 循环（遍历对象属性）
let person = {
  name: "李四",
  age: 28,
  city: "北京"
};
console.log("=== for...in 循环示例 ===");
for (let key in person) {
  console.log(`${key}: ${person[key]}`);
}

// 4. while 循环
console.log("=== while 循环示例 ===");
let counter = 0;
while (counter < 3) {
  console.log(`while 循环：${counter}`);
  counter++;
}

// 5. do...while 循环
console.log("=== do...while 循环示例 ===");
let num = 0;
do {
  console.log(`do...while 循环：${num}`);
  num++;
} while (num < 3);
```

### 4. 函数使用

#### 4.1 函数定义和调用
```typescript
// 1. 基本函数定义
function greet(name: string): string {
  return `你好，${name}！欢迎学习鸿蒙开发`;
}

// 调用函数
let greeting = greet("王五");
console.log(greeting);

// 2. 函数表达式
const add = function(x: number, y: number): number {
  return x + y;
};

console.log(`5 + 3 = ${add(5, 3)}`);

// 3. 箭头函数（ES6+）
const multiply = (x: number, y: number): number => {
  return x * y;
};

// 简写形式（单行返回）
const square = (x: number): number => x * x;

console.log(`4 的平方是 ${square(4)}`);

// 4. 默认参数
function createUser(
  name: string,
  age: number = 18,
  isActive: boolean = true
): string {
  return `用户：${name}，年龄：${age}，状态：${isActive ? '活跃' : '非活跃'}`;
}

console.log(createUser("张三"));           // 使用默认参数
console.log(createUser("李四", 25, false)); // 提供所有参数

// 5. 剩余参数
function sumAll(...numbers: number[]): number {
  let total = 0;
  for (let num of numbers) {
    total += num;
  }
  return total;
}

console.log(`总和：${sumAll(1, 2, 3, 4, 5)}`); // 15
```

#### 4.2 函数进阶
```typescript
// 1. 函数重载（TypeScript 特性）
function processInput(input: string): string;
function processInput(input: number): number;
function processInput(input: string | number): string | number {
  if (typeof input === "string") {
    return `字符串：${input.toUpperCase()}`;
  } else {
    return input * 2;
  }
}

console.log(processInput("hello")); // "字符串：HELLO"
console.log(processInput(10));      // 20

// 2. 回调函数
function fetchData(callback: (data: string) => void): void {
  // 模拟异步操作
  setTimeout(() => {
    const data = "获取到的数据";
    callback(data);
  }, 1000);
}

fetchData((data) => {
  console.log(`回调函数接收到数据：${data}`);
});

// 3. 高阶函数
function createMultiplier(factor: number): (x: number) => number {
  return function(x: number): number {
    return x * factor;
  };
}

const double = createMultiplier(2);
const triple = createMultiplier(3);

console.log(`双倍：${double(5)}`);   // 10
console.log(`三倍：${triple(5)}`);   // 15
```

### 5. 今日实战练习

#### 练习1：计算器函数
```typescript
// 创建一个简单的计算器函数
function calculator(
  operation: "add" | "subtract" | "multiply" | "divide",
  a: number,
  b: number
): number {
  switch (operation) {
    case "add":
      return a + b;
    case "subtract":
      return a - b;
    case "multiply":
      return a * b;
    case "divide":
      if (b === 0) {
        throw new Error("除数不能为零");
      }
      return a / b;
    default:
      throw new Error("不支持的操作");
  }
}

// 测试计算器
try {
  console.log(`5 + 3 = ${calculator("add", 5, 3)}`);
  console.log(`10 - 4 = ${calculator("subtract", 10, 4)}`);
  console.log(`6 * 7 = ${calculator("multiply", 6, 7)}`);
  console.log(`20 / 5 = ${calculator("divide", 20, 5)}`);
} catch (error) {
  console.error(`计算错误：${error.message}`);
}
```

#### 练习2：学生成绩统计
```typescript
// 定义一个学生成绩统计函数
function analyzeScores(scores: number[]): {
  average: number;
  highest: number;
  lowest: number;
  passed: number;
  failed: number;
} {
  if (scores.length === 0) {
    throw new Error("成绩数组不能为空");
  }

  let total = 0;
  let highest = scores[0];
  let lowest = scores[0];
  let passed = 0;
  let failed = 0;

  for (let score of scores) {
    total += score;

    if (score > highest) highest = score;
    if (score < lowest) lowest = score;

    if (score >= 60) {
      passed++;
    } else {
      failed++;
    }
  }

  const average = total / scores.length;

  return {
    average: parseFloat(average.toFixed(2)),
    highest,
    lowest,
    passed,
    failed
  };
}

// 测试成绩统计
const testScores = [85, 92, 78, 45, 67, 88, 56, 91, 72, 60];
const result = analyzeScores(testScores);

console.log("=== 学生成绩统计结果 ===");
console.log(`平均分：${result.average}`);
console.log(`最高分：${result.highest}`);
console.log(`最低分：${result.lowest}`);
console.log(`及格人数：${result.passed}`);
console.log(`不及格人数：${result.failed}`);
```

#### 练习3：简单的鸿蒙应用结构
```typescript
// 这是一个简化的鸿蒙应用结构示例
// 在实际开发中，这会在 .ets 文件中

// 导入鸿蒙组件
// import { Component, Entry, State } from '@arkui/components';

// @Entry
// @Component
struct MyFirstApp {
  // @State message: string = "Hello, HarmonyOS!";
  // @State count: number = 0;

  // build() {
  //   // 这里会构建UI界面
  //   // Column() {
  //   //   Text(this.message)
  //   //     .fontSize(30)
  //   //     .fontWeight(FontWeight.Bold)
  //   //
  //   //   Text(`点击次数：${this.count}`)
  //   //     .fontSize(20)
  //   //
  //   //   Button('点击我')
  //   //     .onClick(() => {
  //   //       this.count++;
  //   //       this.message = `你点击了 ${this.count} 次`;
  //   //     })
  //   // }
  // }
}

// 注意：上面的代码是概念性的，实际开发需要在 DevEco Studio 中创建项目
```

## 📋 今日学习总结

### ✅ 已完成的学习内容
1. **ArkTS 变量声明**：掌握 `let`、`const` 的使用
2. **基本数据类型**：了解 number、string、boolean、array 等类型
3. **运算符使用**：算术、比较、逻辑、赋值运算符
4. **流程控制**：if-else、switch、for、while 等语句
5. **函数编程**：函数定义、参数、返回值、箭头函数
6. **实战练习**：完成计算器和成绩统计练习

### 🔧 需要练习的技能
1. **多写代码**：每天至少编写 50 行 ArkTS 代码
2. **理解类型**：熟练掌握 TypeScript 的类型系统
3. **调试技巧**：学习使用 DevEco Studio 的调试功能
4. **查阅文档**：遇到问题先查看官方文档

### 🎯 明日学习计划
1. **面向对象基础**：类、对象、继承
2. **接口和类型**：接口定义、类型别名
3. **模块化开发**：导入导出模块
4. **简单 UI 开发**：学习基础 ArkUI 组件

## 💡 学习建议

### 1. 学习资源
- **官方文档**：https://developer.harmonyos.com/
- **ArkTS 教程**：华为开发者学堂的免费课程
- **社区论坛**：华为开发者社区的问题解答

### 2. 学习方法
- **循序渐进**：不要急于求成，打好基础最重要
- **动手实践**：看十遍不如写一遍
- **及时复习**：每天花 15 分钟复习前一天的内容
- **记录问题**：遇到问题及时记录并寻找解决方案

### 3. 学习工具
- **DevEco Studio**：官方 IDE，功能完整
- **模拟器**：用于测试应用
- **代码片段**：收集常用的代码模板
- **笔记软件**：记录学习心得和问题

## 🔗 相关链接
- [[鸿蒙/0305-鸿蒙开发]] - 鸿蒙开发概述
- [[TypeScript]] - ArkTS 的基础语言
- [[前端开发]] - 相关的前端知识

---

**学习心得记录区**（请在此记录您的学习心得和遇到的问题）：

**日期**：2026年3月5日
**学习时长**：___小时
**掌握程度**：□ 完全掌握 □ 基本掌握 □ 需要复习
**遇到的问题**：

**明日学习目标**：

## 📊 学习进度跟踪表

| 学习模块 | 学习日期 | 掌握程度 | 练习完成 | 复习次数 | 备注 |
|----------|----------|----------|----------|----------|------|
| **1. 环境准备** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 |  |
| **2. 变量声明** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 |  |
| **3. 数据类型** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 |  |
| **4. 运算符** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 |  |
| **5. 条件语句** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 |  |
| **6. 循环语句** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 |  |
| **7. 函数基础** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 |  |
| **8. 函数进阶** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 |  |
| **9. 实战练习1** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 | 计算器函数 |
| **10. 实战练习2** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 | 成绩统计 |
| **11. 实战练习3** | 2026-03-05 | □未开始 □进行中 □已完成 | □是 □否 | 0 | 应用结构 |

### 学习建议使用方法：
1. **学习时**：在每个模块学习完成后，标记"掌握程度"和"练习完成"
2. **复习时**：每次复习增加"复习次数"
3. **遇到问题**：在"备注"栏记录遇到的问题
4. **定期检查**：每周检查学习进度，调整学习计划

### 掌握程度标准：
- **未开始**：尚未学习该模块
- **进行中**：正在学习，但尚未完全掌握
- **已完成**：理解概念并能独立完成相关练习

