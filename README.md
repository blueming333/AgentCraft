<p align="center">
  <img src="assets/logo.jpg" width="200"/>
</p>

中文 | [English](README-en.md)

# 🎉 AiCraft - 智能化项目管理助手

## 项目愿景

AiCraft 致力于打造一个全流程智能化的项目管理系统，通过 AI 赋能实现：

1. 自动根据用户需求生成详细、专业的项目文档
2. 智能化生成订单，提高业务处理效率
3. 自动派单给 AiCraft 团队成员，合理分配工作任务
4. 全流程项目管理自动化，实时跟踪项目进度
5. 为团队成员提供智能辅助，提高工作效率

## 项目特点

1. 简洁优雅的操作界面 - 直观易用，无需复杂操作
2. 多组织、多用户支持 - 每个团队都可配置自己的 APIKey 和工作流
3. 后台任务执行 - 提出需求，系统自动处理，随时查看结果
4. MCP 的快速集成 - 快速安装各类插件，扩展系统功能
5. 以任务为分区的工作区 - 项目文档和资源集中管理
6. 多轮对话 - 持续优化需求，直到满足客户要求

## 安装指南

该项目分为两个部分，分别是 Core (根目录) 和 App (web/)

### AiCraft Core

1. 安装 uv（一个快速的 Python 包管理器）：

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

2. 克隆仓库：

```bash
git clone https://github.com/blueming333/AgentCraft.git
cd AgentCraft
```

3. 创建并激活虚拟环境：

```bash
uv venv --python 3.12
source .venv/bin/activate  # Unix/macOS 系统
# Windows 系统使用：
# .venv\Scripts\activate

# 安装成功后，会有以下提示，可以选择重开Terminal 或 按照以下提示进行操作
#To add $HOME/.local/bin to your PATH, either restart your shell or run:
#    source $HOME/.local/bin/env (sh, bash, zsh)
#    source $HOME/.local/bin/env.fish (fish)

# 验证 uv 安装成功
uv --version
# 输出以下版本号则表示安装成功
# uv 0.6.14 (a4cec56dc 2025-04-09)
```

4. 安装依赖：

````bash
uv pip install -r requirements.txt

### 安装浏览器自动化工具 playwright
```bash
playwright install
````

5. 安装 Docker 环境，windows 推荐 [Docker Desktop](https://www.docker.com/products/docker-desktop/)，MacOS 或 Linux 推荐 [Orbstack](https://orbstack.dev/download)

### AiCraft App

1. 安装 `node` 环境

   方式 1: [推荐] 使用 nvm 包管理器 https://github.com/nvm-sh/nvm
   方式 2: 前往官方下载 https://nodejs.org/en
   方式 3: (Windows 系统) 使用 nvm 包管理器 https://github.com/coreybutler/nvm-windows/releases/tag/1.2.2

```bash
# 按照流程安装完毕后，通过命令确认安装成功
node -v
# 输出版本号表示安装成功
# v20.19.0
```

2. 进入 `web/` 文件夹

```bash
# 如果已经在 web 目录下忽略即可
cd web
```

3. 安装项目依赖

```bash
# 安装项目依赖
npm install
```

4. 生成密钥对

项目需要一对公钥和私钥用于认证，可以通过以下命令生成（有自行生成证书能力的忽略即可）：

```bash
npm run generate-keys

# 这将在 `web/keys` 目录生成：
# - `private.pem`: 私钥文件
# - `public.pem`: 公钥文件
```

5. 数据库初始化

项目使用 PostgreSQL 作为持久化数据库。可使用 [Docker 容器](https://hub.docker.com/_/postgres) 来启动数据库服务

```bash
# 启动 docker 容器 并自动创建 名为 aicraft 的数据库
docker run --name aicraft-db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=aicraft -d -p 5432:5432 postgres
```

6. 环境变量配置

在项目根目录创建 `.env` 文件，配置必要的环境变量，具体参考 `/web/.env.example`

```bash
# 若按照 步骤 5 配置数据库，则数据库连接为
DATABASE_URL="postgresql://postgres:postgres@localhost:5432/aicraft?schema=public"
```

7. 生成 Prisma 客户端 & 初始化数据库

```bash
# 若第一次启动项目、重新安装了依赖、schema.prisma 存在更新，需执行此命令更新 Prisma Client
npx prisma generate

# 若第一次启动项目，需要先初始化数据库，此命令会自动将表结构同步进相应配置的数据库中
npx prisma db push
```

## 快速启动

```bash
# AiCraft Core 使用 run_api.py 启动
python run_api.py
```

```bash
# AiCraft App 需要进入 web/ 目录， 使用 npm run dev 启动
cd web
npm run dev
```

启动完毕后，打开 `http://localhost:3000` 即可查看

## 使用场景

1. 客户需求收集与文档生成 - 通过对话式交互收集客户需求，自动生成规范的项目文档
2. 智能订单管理 - 根据客户需求自动生成订单，包含详细的工作内容和预算
3. 智能派单系统 - 依据团队成员专长和工作负载自动分配任务
4. 项目进度跟踪 - 实时监控项目进度，自动提醒关键节点
5. 团队协作优化 - 智能整合团队资源，提高工作效率
