---
created: 2026-03-02
tags: [#学习笔记，#docker, #容器化]
source: https://docs.docker.com/get-started/
status: 进行中
---

# Docker 基础入门

## 核心概念

**Docker** 是一个开源的容器化平台，用于开发、打包和运行应用程序。

| 概念 | 说明 |
|------|------|
| **镜像 (Image)** | 只读模板，包含运行应用所需的代码、库、环境变量和配置文件 |
| **容器 (Container)** | 镜像的运行实例，是隔离的进程空间 |
| **Dockerfile** | 构建镜像的脚本，包含一系列构建指令 |
| **Docker Hub** | 官方的镜像仓库，可存储和分享镜像 |
| **卷 (Volume)** | 用于容器数据持久化和共享的存储机制 |

## 关键要点

1. **容器 vs 虚拟机**
   - 容器共享主机内核，更轻量、启动更快
   - 虚拟机有完整的操作系统，资源占用更多

2. **镜像分层**
   - 镜像由多个只读层组成，每层对应一个构建指令
   - 分层设计实现复用，减少存储空间

3. **容器生命周期**
   - 容器是临时的，删除后数据会丢失
   - 使用卷 (Volume) 实现数据持久化

4. **网络模式**
   - `bridge`：默认模式，容器通过虚拟网桥通信
   - `host`：容器共享主机网络
   - `none`：无网络

## 代码示例

```bash
# ==================== 镜像操作 ====================

# 搜索镜像
docker search nginx

# 拉取镜像
docker pull nginx:latest
docker pull nginx:1.21  # 指定版本

# 查看本地镜像
docker images

# 删除镜像
docker rmi nginx:latest


# ==================== 容器操作 ====================

# 运行容器
docker run -d --name my-nginx -p 8080:80 nginx
# -d: 后台运行
# --name: 容器名称
# -p: 端口映射 (主机端口：容器端口)

# 查看运行中的容器
docker ps

# 查看所有容器（包括已停止）
docker ps -a

# 进入容器
docker exec -it my-nginx /bin/bash

# 查看容器日志
docker logs my-nginx
docker logs -f my-nginx  # 实时查看

# 停止/启动/重启容器
docker stop my-nginx
docker start my-nginx
docker restart my-nginx

# 删除容器
docker rm my-nginx
docker rm -f my-nginx  # 强制删除运行中的容器


# ==================== 构建镜像 ====================

# Dockerfile 示例
# FROM nginx:latest
# COPY ./html /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

# 构建镜像
docker build -t my-app:1.0 .

# 查看构建历史
docker history my-app:1.0


# ==================== 数据卷 ====================

# 创建卷
docker volume create my-data

# 挂载卷运行容器
docker run -d --name my-db \
  -v my-data:/var/lib/mysql \
  mysql:8.0

# 查看卷
docker volume ls

# 删除卷
docker volume rm my-data


# ==================== 清理命令 ====================

# 停止所有容器
docker stop $(docker ps -aq)

# 删除所有容器
docker rm $(docker ps -aq)

# 删除所有镜像
docker rmi $(docker images -q)

# 一键清理（慎用）
docker system prune -a
```

## 我的理解

Docker 的核心价值在于**环境一致性**和**快速部署**：

1. **开发体验**：本地环境和生产环境一致，避免"在我机器上能跑"的问题
2. **微服务架构**：每个服务独立容器，便于扩展和管理
3. **CI/CD 集成**：容器化让自动化部署更简单

初次使用时，最容易混淆的是**镜像和容器**的关系：
- 镜像 = 类的定义（只读模板）
- 容器 = 类的实例（运行状态）

## 待深入

- [ ] Docker Compose 多容器编排
- [ ] Dockerfile 最佳实践（多阶段构建、层缓存优化）
- [ ] Docker 网络深入（自定义网络、服务发现）
- [ ] Kubernetes 容器编排
- [ ] 容器安全（镜像扫描、最小权限原则）

## 参考链接

- [Docker 官方文档](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [Dockerfile 最佳实践](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [[02 框架工具]] - 相关开发工具
