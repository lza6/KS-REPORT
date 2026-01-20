<![CDATA[<div align="center">

# ⚡ KS-REPORT | 快手举报执法系统 ⚡

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Cloudflare Workers](https://img.shields.io/badge/Powered%20by-Cloudflare%20Workers-F38020?logo=cloudflare)](https://workers.cloudflare.com/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/lza6/KS-REPORT/pulls)
[![Stars](https://img.shields.io/github/stars/lza6/KS-REPORT?style=social)](https://github.com/lza6/KS-REPORT)

**🚀 基于 Cloudflare Workers 的无服务器快手用户举报工具**

*一行代码部署，全球边缘节点，毫秒级响应，赛博朋克风格控制台*

[🎯 立即部署](#-一键部署懒人专属) · [📖 使用教程](#-详细使用教程小白友好) · [🔧 技术原理](#-核心技术原理深度解析) · [🛣️ 发展路线](#️-项目发展路线图roadmap)

---

</div>

## 📌 项目简介

> 💡 **一句话概括**：这是一个运行在 Cloudflare 边缘网络上的「快手用户举报」自动化工具，采用 **前后端一体化单文件架构**，无需服务器、无需域名，复制粘贴即可部署。

### 🎯 这个项目能做什么？

| 功能 | 描述 | 状态 |
|:---:|:---|:---:|
| 🎯 **精准举报** | 输入目标快手号/UID，自动提交官方举报 | ✅ 已实现 |
| 🔍 **智能 ID 解析** | 自动将快手数字ID转换为内部UID | ✅ 已实现 |
| 👤 **目标预览** | 一键查看目标用户头像、昵称、粉丝数 | ✅ 已实现 |
| 🔁 **批量循环** | 支持自定义次数 + 间隔的自动化循环 | ✅ 已实现 |
| 🌐 **全球加速** | 基于 Cloudflare 全球 300+ 边缘节点 | ✅ 已实现 |
| 🛡️ **隐私保护** | 服务端代理转发，隐藏你的真实 IP | ✅ 已实现 |

---

## 🌟 技术亮点速览

```
🔹 边缘计算架构 (Serverless Edge) · 基于 Cloudflare Workers，零服务器运维
🔹 流量指纹伪装 (Traffic Masquerading) · 深度模拟真实浏览器特征
🔹 智能 ID 反查 (GraphQL Protocol) · 自动解析快手号到内部 UID
🔹 CORS 穿透代理 · 服务端转发请求，绕过浏览器跨域限制
🔹 异步任务引擎 · 支持循环执行 + 可中断 + 冷却间隔
🔹 前后端一体化 (Single-File) · 零依赖单文件交付，内嵌赛博朋克 UI
```

---

## 🚀 一键部署（懒人专属）

> 🎉 **无需服务器、无需域名、无需编程基础，3 分钟搞定！**

### 方式一：Cloudflare 控制台部署（推荐 ⭐⭐⭐⭐⭐）

**点击下方按钮，一键派遣到你的 Cloudflare 账户：**

[![Deploy to Cloudflare Workers](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/lza6/KS-REPORT)

**或者手动操作：**

1. 🔗 打开 [Cloudflare Workers 控制台](https://dash.cloudflare.com/?to=/:account/workers-and-pages)
2. 🆕 点击 **Create Worker**（创建 Worker）
3. 📝 给你的 Worker 起个名字，比如 `ks-report`
4. 📋 **复制** 本项目 [`worker.js`](./worker.js) 的**全部内容**
5. 🗑️ 删除编辑器里的默认代码，**粘贴**进去
6. 💾 点击 **Save and Deploy**（保存并部署）
7. 🎊 完成！点击生成的 `xxx.workers.dev` 链接即可使用

### 方式二：Wrangler CLI 部署（开发者推荐 ⭐⭐⭐⭐）

```bash
# 1. 安装 Wrangler（Cloudflare 官方 CLI 工具）
npm install -g wrangler

# 2. 登录你的 Cloudflare 账户
wrangler login

# 3. 克隆本仓库
git clone https://github.com/lza6/KS-REPORT.git
cd KS-REPORT

# 4. 直接部署
wrangler deploy worker.js --name ks-report

# 5. 查看输出的链接，打开即可使用！
```

### 方式三：本地调试运行（开发者专用）

```bash
# 克隆仓库
git clone https://github.com/lza6/KS-REPORT.git
cd KS-REPORT

# 启动本地开发服务器（需要已安装 wrangler）
wrangler dev worker.js

# 或者使用项目自带的批处理脚本（Windows）
start_dev.bat
```

---

## 📖 详细使用教程（小白友好）

### Step 1️⃣：获取你的快手 Cookie 🍪

> ⚠️ **重要**：Cookie 是你的身份凭证，没有它举报请求会被拒绝！

1. 打开 Chrome 浏览器，访问 [快手官网](https://www.kuaishou.com) 并**登录**你的账号
2. 按 `F12` 打开开发者工具，切换到 `Network`（网络）标签
3. 刷新页面，随便点击一个请求
4. 在右侧找到 `Request Headers`（请求头）
5. 找到 `Cookie` 字段，**复制整行内容**

```
💡 小技巧：Cookie 内容很长，确保全部复制！
   看起来像这样：did=web_xxxxx; didv=xxxxx; userId=xxxxx; ...
```

### Step 2️⃣：填写目标信息 🎯

| 字段 | 说明 | 示例 |
|:---:|:---|:---|
| **目标用户 UID** | 可以是快手数字号（如 `1234567890`）或内部 UID（如 `3xn9cwxxrfh4ydw`） | `3xn9cwxxrfh4ydw` |
| **安全令牌 (Cookie)** | 上一步获取的 Cookie 字符串 | `did=web_xxx; ...` |
| **违规详情** | 举报理由，已预填详细模板 | 可自定义修改 |

### Step 3️⃣：执行举报 ⚡

- 🔘 **「单次打击」**：点击一次，发送一次举报请求
- 🔁 **「自动打击」**：按设定的次数和间隔自动循环执行
- 🔍 **「预览目标」**：发送前先查看目标用户信息确认

### Step 4️⃣：查看结果 📊

右侧终端面板会实时显示：
- ✅ `成功：举报已送达` - 请求成功
- ❌ `失败：认证被拒绝 (Cookie 无效)` - 需要更换 Cookie
- ⚠️ 其他状态码和错误信息

---

## 🔧 核心技术原理（深度解析）

> 🧠 **给技术人员的硬核讲解，也给小白用大白话翻译！**

### 1. 边缘计算架构 (Serverless Edge Computing)

```
┌─────────────┐    ┌──────────────────────┐    ┌─────────────────┐
│  你的浏览器  │ ──▶│  Cloudflare Worker   │ ──▶│  快手 API 服务器 │
│  (前端 UI)  │    │  (全球 300+ 节点)    │    │  (目标服务)      │
└─────────────┘    └──────────────────────┘    └─────────────────┘
```

**大白话**：传统方式需要你自己买服务器，Cloudflare Workers 让你的代码运行在全球 300 多个城市的边缘节点上，离用户最近的节点自动处理请求，速度极快且免费额度超大（每天 10 万次请求）！

**技术点**：
- **V8 Isolates**：每个请求在独立的 V8 隔离环境中运行，启动时间 < 5ms
- **冷启动优化**：无传统容器冷启动问题，首次请求即达毫秒级响应
- **全球 Anycast**：基于 BGP Anycast 网络，自动路由到最近节点

### 2. 流量指纹伪装 (Traffic Fingerprint Masquerading)

```javascript
// 代码中的 Headers 伪装（来自 worker.js 第 75-86 行）
const headers = {
    'Host': 'www.kuaishou.com',
    'Origin': 'https://www.kuaishou.com',
    'Referer': `https://www.kuaishou.com/profile/${userId}`,
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36...',
    'Content-Type': 'application/json',
    'Cookie': payload.cookies,
    'kpn': 'KUAISHOU_VISION'  // 快手特有的平台标识
};
```

**大白话**：就像特工伪装身份一样，我们的请求会模拟成从快手官网发出的正常浏览器请求，这样服务器就不容易识别出这是自动化工具。

**技术点**：
| Header 字段 | 作用 | 伪装难度 |
|:---:|:---|:---:|
| `User-Agent` | 告诉服务器「我是什么浏览器」 | ⭐⭐ |
| `Referer` | 告诉服务器「我从哪个页面来的」 | ⭐⭐⭐ |
| `Origin` | 跨域请求时标明来源域名 | ⭐⭐⭐ |
| `Cookie` | 身份认证凭证，最关键！ | ⭐⭐⭐⭐⭐ |
| `kpn` | 快手自定义的平台标识符 | ⭐⭐⭐⭐ |

### 3. GraphQL 协议智能 ID 解析

```javascript
// 代码中的 GraphQL 查询（来自 worker.js 第 41-49 行）
const searchQuery = {
    operationName: "visionSearchUser",
    variables: { keyword: "1234567890", pcursor: "", searchSessionId: "" },
    query: `query visionSearchUser($keyword: String, $pcursor: String, $searchSessionId: String) {
        visionSearchUser(keyword: $keyword, pcursor: $pcursor, searchSessionId: $searchSessionId) {
            result
            users { user_id user_name headurl user_text }
        }
    }`
};
```

**大白话**：快手有两种用户 ID —— 你看到的数字快手号（如 `1234567890`）和内部系统用的 UID（如 `3xn9cwxxrfh4ydw`）。举报接口只认内部 UID，所以我们用 GraphQL 查询自动帮你转换！

**技术点**：
- **GraphQL**：一种现代 API 查询语言，比传统 REST 更灵活
- **visionSearchUser**：快手的用户搜索接口，返回匹配用户列表
- **自动解析**：输入数字号自动查询真实 UID，无需手动查找

### 4. CORS 穿透与服务端代理

```
浏览器直接请求快手 API ──▶ ❌ 被 CORS 策略阻止
浏览器 ──▶ Cloudflare Worker ──▶ 快手 API ──▶ ✅ 成功
```

**大白话**：浏览器有个安全限制叫「同源策略」（CORS），不允许网页直接请求其他网站的 API。我们用 Worker 作为「中间人」代理转发请求，绕过这个限制。

**技术点**：
- **CORS (Cross-Origin Resource Sharing)**：浏览器安全机制，限制跨域请求
- **服务端代理**：Worker 作为后端转发请求，不受浏览器限制
- **IP 隐藏**：目标服务器只看到 Cloudflare 的 IP，保护你的隐私

### 5. 前后端一体化单文件架构

```javascript
// 整体结构（worker.js）
export default {
    async fetch(request, env, ctx) {
        // 路由 1：返回前端 HTML
        if (url.pathname === '/') return new Response(htmlContent, {...});
        
        // 路由 2：API 代理 - 举报
        if (url.pathname === '/api/report') { ... }
        
        // 路由 3：API 代理 - 用户信息
        if (url.pathname === '/api/profile') { ... }
    }
};

// 前端 HTML/CSS/JS 作为字符串嵌入
const htmlContent = `<!DOCTYPE html>...`;
```

**大白话**：传统项目需要「前端文件 + 后端文件 + 数据库」三件套，我们把**所有东西塞进一个文件**！HTML、CSS、JavaScript、后端逻辑全在 `worker.js` 里，复制粘贴就能跑。

**技术点**：
- **Single-File Application**：零依赖单文件交付
- **Template Literals**：ES6 模板字符串嵌入大段 HTML
- **路由分发**：根据 URL 路径返回不同响应

### 6. 异步任务执行引擎

```javascript
// 自动打击循环逻辑（worker.js 第 701-740 行）
async function startAutoReport() {
    for (let i = 1; i <= count; i++) {
        if (!isAutoRunning) break;  // 支持中途停止
        
        await startReport(true);     // 执行单次举报
        
        if (i < count && isAutoRunning) {
            await new Promise(r => setTimeout(r, interval * 1000));  // 冷却间隔
        }
    }
}
```

**大白话**：不用你一直点，设置好次数和间隔，程序自动帮你循环执行！而且可以随时点击「停止」中断任务。

**技术点**：
- **async/await**：ES2017 异步语法，让异步代码像同步一样易读
- **可中断循环**：`isAutoRunning` 标志位控制，支持优雅停止
- **冷却机制**：`setTimeout` + `Promise` 实现请求间隔

---

## 🎨 UI/UX 设计解析

### 赛博朋克风格控制台

```css
/* 设计系统变量（worker.js 第 229-238 行） */
:root {
    --primary: #FF3506;         /* 快手品牌红 */
    --accent: #00F260;          /* 科技绿 */
    --bg-dark: #050507;         /* 深空黑 */
    --glass: rgba(255,255,255,0.03);  /* 毛玻璃效果 */
}
```

| 设计元素 | 技术实现 | 视觉效果 |
|:---:|:---|:---|
| 🌈 **毛玻璃卡片** | `backdrop-filter: blur(24px)` | 半透明模糊背景 |
| 📺 **CRT 扫描线** | `background-size: 100% 2px` | 复古显示器质感 |
| ✨ **按钮光泽** | `linear-gradient + ::after` | 悬停时光线划过 |
| 🖥️ **终端窗口** | macOS 风格圆点 + 等宽字体 | 黑客电影既视感 |

---

## 📁 项目文件结构

```
KS-REPORT/
│
├── 📄 worker.js          # 🌟 核心文件！前后端一体化代码（约 860 行）
│   ├── [1-215]          # 后端逻辑：路由、API 代理、GraphQL 查询
│   ├── [216-526]        # 前端样式：CSS 变量、毛玻璃、动画
│   ├── [527-605]        # 前端结构：HTML 布局、表单、终端
│   └── [606-862]        # 前端脚本：事件处理、异步请求、状态管理
│
├── 📄 README.md          # 项目文档（你正在看的这个）
├── 📄 LICENSE            # Apache 2.0 开源协议
│
├── 📄 start_dev.bat      # Windows 本地调试启动脚本
├── 📄 frontend.html      # 前端开发用独立 HTML（已合并到 worker.js）
├── 📄 debug.mjs          # 调试工具脚本
├── 📄 find_comma.js      # 代码检查辅助脚本
│
└── 📁 .wrangler/         # Wrangler CLI 缓存目录（自动生成）
```

### 核心文件详解

| 文件 | 是否必需 | 说明 |
|:---:|:---:|:---|
| `worker.js` | ✅ **必需** | 唯一需要部署的文件，包含全部功能 |
| `README.md` | 📖 推荐 | 项目说明文档 |
| `LICENSE` | 📜 推荐 | 开源协议声明 |
| 其他文件 | ❌ 不需要 | 开发调试用，部署时可忽略 |

---

## ⚖️ 优缺点分析

### ✅ 优点

| 维度 | 优势 | 说明 |
|:---:|:---|:---|
| 🚀 **部署速度** | 3 分钟即可上线 | 复制粘贴即部署，无需配置环境 |
| 💰 **运行成本** | 完全免费 | Cloudflare Workers 免费额度 10 万次/天 |
| 🌍 **全球加速** | 毫秒级响应 | 300+ 边缘节点，就近处理请求 |
| 🔒 **隐私保护** | IP 不暴露 | 目标只看到 Cloudflare 的 IP |
| 📦 **零依赖** | 单文件交付 | 无需 npm install，无需外部库 |
| 🎨 **颜值在线** | 赛博朋克风 | 不是那种丑到哭的命令行工具 |

### ⚠️ 缺点与局限

| 维度 | 局限 | 原因 |
|:---:|:---|:---|
| 🍪 **依赖 Cookie** | 需要手动获取 | 快手 API 强制要求登录态 |
| ⏰ **Cookie 过期** | 需要定期更换 | 一般 7-30 天失效 |
| 🤖 **无验证码绑定** | 无法自动绕过滑块 | Cloudflare Workers 不支持浏览器自动化 |
| 📊 **无持久化存储** | 刷新丢失状态 | Workers 无状态，可扩展 KV 存储 |
| 🔐 **风控风险** | 频繁请求可能被限制 | 建议设置合理间隔 |

---

## 🛣️ 项目发展路线图（Roadmap）

### 🏁 已完成（v1.0）

- [x] ✅ 核心举报功能
- [x] ✅ 智能 ID 解析（快手号 → UID）
- [x] ✅ 用户信息预览
- [x] ✅ 批量循环执行
- [x] ✅ 赛博朋克 UI
- [x] ✅ 服务端代理（CORS 穿透）
- [x] ✅ 错误处理与状态反馈

### 🔨 计划中（v1.1 ~ v2.0）

- [ ] 🔲 **KV 存储**：持久化保存 Cookie 和执行记录
- [ ] 🔲 **多账号支持**：管理多个 Cookie，轮换使用
- [ ] 🔲 **举报类型选择**：支持更多违规类型
- [ ] 🔲 **定时任务**：Cron Trigger 实现定时执行
- [ ] 🔲 **Telegram Bot**：远程控制执行任务
- [ ] 🔲 **数据统计**：历史举报记录与成功率分析

### 🌟 远期愿景（v3.0+）

- [ ] 🔲 **浏览器扩展版**：Chrome/Edge 插件，一键举报
- [ ] 🔲 **移动端适配**：PWA 支持，手机也能用
- [ ] 🔲 **API 开放**：提供 REST API 供其他应用调用
- [ ] 🔲 **多平台支持**：扩展到抖音、B站等平台

---

## 🔬 技术点评级与学习路径

> 🎓 **给想学习的开发者**：以下是本项目涉及的技术点，按学习难度评级

| 技术点 | 难度 | 学习资源 | 在本项目的应用 |
|:---|:---:|:---|:---|
| **HTML/CSS 基础** | ⭐ | MDN Web Docs | 前端界面结构与样式 |
| **JavaScript ES6+** | ⭐⭐ | javascript.info | 模板字符串、解构、async/await |
| **Fetch API** | ⭐⭐ | MDN Fetch API | 发送 HTTP 请求 |
| **CSS 变量** | ⭐⭐ | CSS Tricks | 设计系统主题色管理 |
| **Backdrop Filter** | ⭐⭐ | CSS 毛玻璃效果 | 卡片半透明模糊 |
| **Cloudflare Workers** | ⭐⭐⭐ | Cloudflare Docs | 边缘计算运行时 |
| **GraphQL** | ⭐⭐⭐ | graphql.org | 快手用户搜索 API |
| **HTTP Headers 伪装** | ⭐⭐⭐ | 逆向工程文章 | 模拟浏览器请求 |
| **CORS 原理** | ⭐⭐⭐ | MDN CORS | 理解为什么需要代理 |
| **API 逆向分析** | ⭐⭐⭐⭐ | 抓包工具 (Fiddler/Charles) | 分析快手 API 结构 |

### 📚 推荐学习路径

```
1️⃣ HTML/CSS/JS 基础
   └──▶ 2️⃣ 了解 HTTP 协议与 Fetch API
         └──▶ 3️⃣ 学习 Cloudflare Workers 入门
               └──▶ 4️⃣ 实践 API 逆向与抓包分析
                     └──▶ 5️⃣ 扩展：GraphQL / KV 存储 / Cron Trigger
```

---

## 🛠️ 二次开发指南

### 如何添加新的举报类型？

```javascript
// 找到 worker.js 第 776-784 行的 data 对象
const reportData = {
    "reportType": 2,      // 举报类型：1=作品, 2=用户
    "reportItem": 203,    // 违规项：203=违法违规, 201=垃圾广告, 202=色情低俗
    // ...
};

// 修改 reportItem 的值即可切换举报原因
// 可以在 UI 中添加下拉选择框让用户选择
```

### 如何添加 KV 存储？

```javascript
// 1. 在 Cloudflare 控制台创建 KV 命名空间
// 2. 绑定到 Worker

// 3. 在代码中使用
export default {
    async fetch(request, env) {
        // 读取
        const cookie = await env.MY_KV.get("saved_cookie");
        
        // 写入
        await env.MY_KV.put("saved_cookie", newCookie);
    }
};
```

### 如何添加定时任务？

```javascript
// 在 wrangler.toml 中配置
// [triggers]
// crons = ["0 * * * *"]  // 每小时执行

export default {
    async fetch(request, env) { /* 原有逻辑 */ },
    
    // 新增：定时触发器
    async scheduled(event, env, ctx) {
        // 定时执行的逻辑
        await autoReport(env);
    }
};
```

---

## ❓ 常见问题 FAQ

### Q: 为什么提示「Cookie 无效」？

**A**: Cookie 有有效期，过期后需要重新获取。步骤：
1. 清除浏览器缓存，重新登录快手
2. 按 F12 → Network → 刷新页面 → 复制新的 Cookie

### Q: 举报真的有用吗？

**A**: 本工具只是帮你**自动提交**举报请求，是否处理取决于平台审核。多次举报可能提高优先级。

### Q: 会不会封我的账号？

**A**: 有风险。频繁请求可能触发风控，建议：
- 设置合理的执行间隔（建议 5-10 秒）
- 不要设置过多的循环次数
- 使用小号进行操作

### Q: 支持其他平台吗？

**A**: 暂时只支持快手。理论上可以扩展到任何有 API 的平台，欢迎 PR！

---

## 🤝 贡献指南

我们欢迎任何形式的贡献！

1. 🍴 **Fork** 本仓库
2. 🌿 创建你的 Feature 分支 (`git checkout -b feature/AmazingFeature`)
3. 📝 提交你的修改 (`git commit -m 'Add some AmazingFeature'`)
4. 📤 Push 到分支 (`git push origin feature/AmazingFeature`)
5. 🔃 创建 **Pull Request**

### 贡献方向

- 🐛 修复 Bug
- ✨ 新增功能
- 📖 完善文档
- 🎨 优化 UI/UX
- 🌐 多语言支持

---

## 📜 开源协议

本项目基于 **Apache License 2.0** 开源。

```
Copyright 2026 lza6

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

**简单来说**：
- ✅ 可以商业使用
- ✅ 可以修改代码
- ✅ 可以分发
- ✅ 可以私人使用
- ⚠️ 需要保留版权声明
- ⚠️ 需要说明修改内容
- ❌ 作者不承担责任

---

## ⚠️ 免责声明

> 🚨 **重要提醒**

1. 本工具仅供学习和研究使用，请勿用于非法用途
2. 使用本工具产生的任何后果由使用者自行承担
3. 请遵守《中华人民共和国网络安全法》等相关法律法规
4. 请勿恶意骚扰他人，理性使用举报功能
5. 尊重他人隐私，不要滥用 Cookie 信息

---

## 🌟 Star History

如果这个项目对你有帮助，请给个 Star ⭐ 支持一下！

[![Star History Chart](https://api.star-history.com/svg?repos=lza6/KS-REPORT&type=Date)](https://star-history.com/#lza6/KS-REPORT&Date)

---

<div align="center">

**Made with ❤️ by [lza6](https://github.com/lza6)**

*🚀 如果觉得有用，别忘了点个 Star 哦！*

[⬆️ 回到顶部](#-ks-report--快手举报执法系统-)

</div>
]]>
