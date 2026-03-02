# Obsidian + Claudian + GitHub 同步完整教程

> 本教程将指导你搭建一个基于 Obsidian 的知识库系统，结合 Claudian AI 助手和 GitHub 实现安全同步。

---

## 📋 目录

1. [准备工作](#准备工作)
2. [安装 Obsidian](#安装-obsidian)
3. [配置 Claudian AI 助手](#配置-claudian-ai-助手)
4. [设置 GitHub 仓库](#设置-github-仓库)
5. [同步到 GitHub](#同步到-github)
6. [最佳实践](#最佳实践)
7. [常见问题](#常见问题)

---

## 准备工作

### 硬件与软件要求

| 项目 | 要求 |
|------|------|
| 操作系统 | Windows / macOS / Linux |
| 存储空间 | 至少 500MB 可用空间 |
| 网络 | 稳定的互联网连接（用于同步） |
| GitHub 账号 | 需要注册免费账号 |

### 需要安装的工具

- [ ] **Obsidian** - 核心笔记应用
- [ ] **Git** - 版本控制工具
- [ ] **GitHub Desktop**（可选）- 可视化 Git 客户端
- [ ] **Claude Code** - Claudian 的底层框架

### 术语说明

- **Vault（仓库）**：Obsidian 中存储所有笔记的文件夹
- **Wiki-links**：Obsidian 内部链接语法 `[[笔记名]]`
- **Frontmatter**：笔记开头的 YAML 元数据区域

---

## 安装 Obsidian

### 步骤 1：下载 Obsidian

1. 访问官方网站：[https://obsidian.md](https://obsidian.md)
2. 根据你的操作系统选择对应版本
3. 下载安装包并运行安装程序

### 步骤 2：创建或打开 Vault

```markdown
# 方法 A：创建新 Vault
1. 启动 Obsidian
2. 点击 "Create new vault"
3. 选择存储位置（建议使用同步文件夹）
4. 输入 Vault 名称，点击 "Create"

# 方法 B：打开现有 Vault
1. 启动 Obsidian
2. 点击 "Open folder as vault"
3. 选择已有的笔记文件夹
```

### 步骤 3：基础设置推荐

进入 **设置 (Settings)** → **编辑器 (Editor)**：

- ✅ 显示行号
- ✅ 启用拼写检查
- ✅ 使用 Wikilinks
- ✅ 自动配对括号

---

## 配置 Claudian AI 助手

### 什么是 Claudian？

**Claudian** 是一个专为 Obsidian 设计的 AI 助手，能够：

- 智能管理笔记文件
- 处理 Wiki-links 和双向链接
- 维护知识库结构
- 辅助代码分析和文档编写

### 安装 Claude Code

#### macOS / Linux

```bash
# 使用 npm 安装
npm install -g @anthropic/claude-code

# 或使用 Homebrew (macOS)
brew install claude-code
```

#### Windows

```powershell
# 使用 npm 安装
npm install -g @anthropic/claude-code
```

### 配置 Claudian

1. **初始化配置**

```bash
claude config
```

2. **设置工作目录**

```bash
# 进入你的 Obsidian Vault 目录
cd ~/Documents/Obsidian/Obsidian
```

3. **验证安装**

```bash
claude --version
```

### 在 Obsidian 中使用 Claudian

Claudian 可以直接在终端或通过 Obsidian 插件调用：

```markdown
## 常用命令示例

# 搜索笔记
claude "搜索所有关于 Python 的笔记"

# 创建新笔记
claude "创建一个关于机器学习的笔记"

# 整理链接
claude "修复所有断开的 Wiki-links"
```

---

## 设置 GitHub 仓库

### 步骤 1：创建 GitHub 账号

1. 访问 [https://github.com](https://github.com)
2. 点击 "Sign up" 注册账号
3. 验证邮箱

### 步骤 2：创建新仓库

```markdown
1. 登录 GitHub
2. 点击右上角 "+" → "New repository"
3. 填写仓库信息：
   - Repository name: obsidian-vault（或其他名称）
   - Description: My Obsidian Knowledge Base
   - 选择 "Private"（推荐，保护隐私）
   - 不要勾选 "Initialize this repository with a README"
4. 点击 "Create repository"
```

### 步骤 3：配置本地 Git

```bash
# 初始化 Git 仓库
cd ~/Documents/Obsidian/Obsidian
git init

# 添加远程仓库
git remote add origin https://github.com/你的用户名/obsidian-vault.git

# 创建 .gitignore 文件
cat > .gitignore << EOF
# Obsidian
.obsidian/plugins/*/manifest.json
.obsidian/plugins/*/styles.css
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.obsidian/appearance.json
.obsidian/community-plugins.json
.obsidian/graph.json
.obsidian/canvas-backlinks.json

# 系统文件
.DS_Store
Thumbs.db
._*

# 临时文件
*.tmp
*.swp
*~
EOF
```

### 步骤 4：配置 Git 用户信息

```bash
# 设置用户名
git config --global user.name "你的 GitHub 用户名"

# 设置邮箱
git config --global user.email "你的邮箱@example.com"
```

---

## 同步到 GitHub

### 首次同步

```bash
# 1. 添加所有文件
git add .

# 2. 提交更改
git commit -m "Initial commit: Obsidian vault setup"

# 3. 推送到 GitHub
git branch -M main
git push -u origin main
```

### 日常同步流程

#### 上传本地更改到 GitHub

```bash
# 方法 1：手动命令
cd ~/Documents/Obsidian/Obsidian
git add .
git commit -m "添加新的学习笔记"
git push

# 方法 2：使用 Git 别名（推荐）
# 在 ~/.gitconfig 中添加：
[alias]
    s = status
    a = add .
    c = commit -m
    p = push

# 然后使用：
git a
git c "添加新的学习笔记"
git p
```

#### 从 GitHub 拉取更新

```bash
# 拉取远程更改
git pull origin main

# 如果有冲突，先解决冲突再提交
```

### 使用 GitHub Desktop（可选）

对于不熟悉命令行的用户：

```markdown
1. 下载 GitHub Desktop：https://desktop.github.com
2. 登录后选择 "Add Local Repository"
3. 选择你的 Obsidian Vault 文件夹
4. 点击 "Commit to main" 提交更改
5. 点击 "Push origin" 上传到 GitHub
```

### 自动化同步脚本

创建自动同步脚本 `sync.sh`（macOS/Linux）：

```bash
#!/bin/bash
# Obsidian Vault 自动同步脚本

VAULT_PATH="$HOME/Documents/Obsidian/Obsidian"
MESSAGE="${1:-Auto sync from $(date '+%Y-%m-%d %H:%M')}"

cd "$VAULT_PATH" || exit

echo "📝 开始同步 Obsidian Vault..."

git add .
git status --porcelain

if [ $? -eq 0 ]; then
    git commit -m "$MESSAGE"
    git push origin main
    echo "✅ 同步完成！"
else
    echo "❌ 没有需要提交的更改"
fi
```

使用方式：

```bash
# 添加执行权限
chmod +x sync.sh

# 运行同步
./sync.sh "手动提交消息"
# 或
./sync.sh  # 使用默认消息
```

---

## 最佳实践

### 📁 文件组织建议

```
Obsidian Vault/
├── 00.inbox/          # 临时笔记，待整理
├── 10.projects/       # 项目相关
├── 20.areas/          # 责任领域
├── 30.resources/      # 资源库
├── 40.archives/       # 归档
├── templates/         # 模板文件
└── attachments/       # 图片、文件附件
```

### 🏷️ 标签规范

```markdown
# 使用层级标签
#area/工作
#area/学习
#type/笔记
#type/模板
#status/进行中
#status/已完成
```

### 📝 笔记模板

```markdown
---
created: {{date}}
tags: [type/笔记]
aliases: []
---

# {{title}}

## 概述


## 内容


## 参考链接


## 相关笔记
- [[笔记 1]]
- [[笔记 2]]
```

### 🔒 安全建议

| 建议 | 说明 |
|------|------|
| **使用 Private 仓库** | 保护个人知识隐私 |
| **启用双重验证** | GitHub 账号安全 |
| **不提交敏感信息** | 密码、API 密钥等 |
| **定期备份** | 多地备份重要数据 |
| **审阅 .gitignore** | 确保不泄露配置 |

### ⚡ 效率技巧

1. **使用 Quick Switcher**：`Cmd/Ctrl + O` 快速跳转笔记
2. **使用全局搜索**：`Cmd/Ctrl + Shift + F` 搜索全部内容
3. **使用 Daily Notes**：建立每日记录习惯
4. **使用 Templates**：标准化笔记格式

---

## 常见问题

### Q1：Git 冲突如何解决？

```bash
# 1. 拉取最新代码
git pull origin main

# 2. 如果有冲突，打开冲突文件手动解决
# 冲突标记如下：
<<<<<<< HEAD
你的本地更改
=======
远程更改
>>>>>>> origin/main

# 3. 解决后重新提交
git add 文件名
git commit -m "解决冲突"
git push
```

### Q2：图片同步有问题？

确保图片存储在 Vault 内部：

```markdown
# 正确：图片在 Vault 内
![[attachments/image.png]]

# 错误：外部路径无法同步
![[/Users/xxx/Desktop/image.png]]
```

在 Obsidian 设置中：
- 进入 **设置** → **文件与链接**
- 设置 **附件文件夹** 为 `attachments`

### Q3：同步速度慢？

```bash
# 使用 SSH 代替 HTTPS（更快更安全）
# 1. 生成 SSH 密钥
ssh-keygen -t ed25519 -C "your_email@example.com"

# 2. 添加公钥到 GitHub
cat ~/.ssh/id_ed25519.pub
# 复制输出，添加到 GitHub: Settings → SSH and GPG keys

# 3. 修改远程仓库
git remote set-url origin git@github.com:用户名/仓库名.git
```

### Q4：如何回滚到之前的版本？

```bash
# 查看提交历史
git log --oneline

# 回滚到指定版本
git reset --hard abc1234  # abc1234 是提交哈希

# 或者创建新分支保留当前状态
git branch backup-branch
git reset --hard abc1234
```

### Q5：多设备同步建议？

推荐方案组合：

| 方案 | 优点 | 缺点 |
|------|------|------|
| **GitHub + 手动同步** | 免费、可控 | 需要手动操作 |
| **GitHub + Git 别名** | 快速同步 | 仍需命令操作 |
| **Obsidian Sync** | 官方方案、自动 | 付费服务 |
| **iCloud/网盘 + Git** | 自动 + 版本控制 | 可能冲突 |

---

## 📚 延伸阅读

- [Obsidian 官方文档](https://help.obsidian.md)
- [Git 官方文档](https://git-scm.com/doc)
- [GitHub 入门指南](https://docs.github.com/en/get-started)
- [Claude Code 文档](https://github.com/anthropics/claude-code)

---

*最后更新：2026-02-28*
*版本：1.0.0*
