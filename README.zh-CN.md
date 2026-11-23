<p align="center">
  <img src="docs/images/vira-reader-icon.png" width="88" height="88" alt="">
</p>

<h1 align="center">Vira Reader</h1>

<p align="center"><strong>原生 macOS 阅读器，轻松阅读电子书、漫画、PDF、图片和 Markdown。</strong></p>

<p align="center">macOS 13 或更高版本 · Apple 芯片 · 免费开源</p>

<p align="center">
  <a href="https://github.com/Ares-X/Vira-Reader/releases/latest"><strong>下载 Mac 版</strong></a>
  · <a href="#支持的格式">支持格式</a>
  · <a href="https://github.com/Ares-X/Vira-Reader/releases">版本说明</a>
</p>

<p align="center">
  <a href="README.md">English</a>
  · <strong>简体中文</strong>
  · <a href="README.zh-TW.md">繁體中文</a>
  · <a href="README.ja.md">日本語</a>
</p>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/images/reader-dark.png">
    <img src="docs/images/reader-light.png" width="850" alt="Vira Reader 中的 Markdown 阅读界面，左侧为目录">
  </picture>
</p>

## 安装与开始阅读

1. 从[最新发行版](https://github.com/Ares-X/Vira-Reader/releases/latest)下载文件名以 **-macOS-arm64.zip** 结尾的安装包。
2. 解压后，将 **Vira Reader.app** 移入「应用程序」。
3. 打开应用，按 **⌘O** 或直接拖入文件。按 **⌘F** 搜索正文。

应用使用维护者的 **Ares-X Code Signing** 自签名证书，未经 Apple 公证。若 macOS 阻止首次启动，且你确认下载来源可信，可前往「系统设置 → 隐私与安全性 → 仍要打开」。[Apple 官方说明](https://support.apple.com/zh-cn/102445)

选择「帮助 → 检查更新…」，即可通过 Sparkle 获取新版，也可在设置中启用自动检查。发行页提供 SHA-256 校验值和对应源码。

<details>
<summary>从 Sumra 迁移与系统兼容性</summary>

Vira Reader 是 Sumra 的新名称。手动安装一次即可切换到新的更新源。首次启动会导入 Sumra 的偏好设置和阅读历史，并保留 Vira Reader 中已经保存的设置。如需重新关联文件，可在 Finder 中设置。macOS 的窗口恢复状态会重新建立。

最低部署目标为 macOS 13。下方记录中的迁移和阅读功能验证使用 macOS 26.6.2 虚拟机。[迁移与兼容性验证](docs/RELEASE_0_2_48_ACCEPTANCE.md)

</details>

## 专注阅读

- **从 Finder 打开，接着上次读。** 支持原生窗口和标签页，可快速找到最近文件和已保存的阅读位置。
- **按习惯调整版面。** 支持单页、连续滚动和双页阅读，提供五种内置主题与自定义配色。重排文档可调整字体、行距和边距。
- **找段落、跳章节。** 使用全文搜索、目录、缩略图和书签。漫画压缩包可按文件夹层级浏览，EPUB 和漫画支持在 Finder 中快速查看。
- **在阅读器里处理 PDF。** 选择「启用编辑」后，即可填写表单、添加注释、提取或合并页面，并保存修改。「存储副本」保留可编辑的表单和注释。「导出 PDF」生成静态副本。
- **朗读、打印或导出。** 使用 macOS 系统语音朗读正文或选区，也可通过系统打印面板打印。可用操作取决于文件格式与权限。

[阅读控件与快捷键](docs/READER_CONTROLS.md) · [SyncTeX 集成](docs/SYNCTEX.md) · [Markdown 示例文档](docs/demos/Reading-Notes.md)

<details>
<summary>阅读主题与最近文档</summary>

![五种内置阅读主题](docs/images/themes.png)

![Vira Reader 首页中的最近文档](docs/images/home-light.png)

</details>

## 支持的格式

| 类型 | 格式 |
| --- | --- |
| PDF 与固定页面 | PDF、XPS / OXPS、SVG、DjVu |
| 电子书 | EPUB、MOBI、AZW、PRC、FB2 / 压缩 FB2 |
| 漫画与图片 | CBZ、CBR、CB7、CBT、图片文件夹；常见图片格式，包括 GIF、TIFF、JPEG XL |
| 文本与网页 | Markdown、HTML / XHTML、CHM、TXT 等纯文本、TCR |
| 其他兼容格式 | PDF 兼容的 AI、P7M 封装、LIT |
| 需额外软件 | PostScript / EPS：另行安装 Ghostscript |

支持范围取决于具体文件变体。扫描页需要已有文本层才能搜索。应用不提供 OCR 或 DRM 移除。

[格式与引擎支持范围](docs/SUMATRA_ENGINE_PARITY.md) · [Markdown 渲染](docs/MARKDOWN_RENDERER_DECISION.md) · [扫描 PDF 显示](docs/SCANNED_PDF_DISPLAY.md)

## 从源码构建

需要 macOS、Apple Swift 工具链、macOS SDK 和 CMake。首次构建会下载固定版本的原生依赖和 Sparkle。

```sh
git clone https://github.com/Ares-X/Vira-Reader.git
cd Vira-Reader
./scripts/build-app.sh --release
open "dist/Vira Reader.app"
```

运行 `./scripts/run-dev.sh` 可构建并启动开发版。本地构建使用临时签名。[本地检查](scripts/check-source.sh) · [发布流程](docs/RELEASE_ACTIONS.md)

## 参与贡献与翻译

反馈时请提供 macOS 与 Vira Reader 版本、文件格式和复现步骤，有条件的话附上可公开分享的样本。[报告问题或提出建议](https://github.com/Ares-X/Vira-Reader/issues)

应用提供 25 个界面语言与地区选项，欢迎母语使用者协助校订。更新 README 的共用信息时，请同步维护四种语言版本。[语言支持](docs/LANGUAGE_SUPPORT.md)

<!-- community-contributors:start -->
## 社区贡献者

感谢通过问题反馈、代码和评审帮助改进 Vira Reader 的每一位贡献者。此名单根据符合条件的 GitHub Issue 和已合并的 Pull Request 自动更新。详见[计入规则](docs/COMMUNITY_CONTRIBUTORS.md)。

| 贡献者 | 贡献记录 |
| --- | --- |
| <a href="https://github.com/HomeStarRunnerTron"><img src="https://github.com/HomeStarRunnerTron.png?size=80" alt="@HomeStarRunnerTron" width="40"></a> [@HomeStarRunnerTron](https://github.com/HomeStarRunnerTron) | 📝 [问题 #31](https://github.com/Ares-X/Vira-Reader/issues/31) [问题 #42](https://github.com/Ares-X/Vira-Reader/issues/42) [问题 #68](https://github.com/Ares-X/Vira-Reader/issues/68) [问题 #69](https://github.com/Ares-X/Vira-Reader/issues/69) [问题 #82](https://github.com/Ares-X/Vira-Reader/issues/82) [问题 #118](https://github.com/Ares-X/Vira-Reader/issues/118) [问题 #137](https://github.com/Ares-X/Vira-Reader/issues/137) [问题 #158](https://github.com/Ares-X/Vira-Reader/issues/158) [问题 #165](https://github.com/Ares-X/Vira-Reader/issues/165) |
| <a href="https://github.com/2924661311"><img src="https://github.com/2924661311.png?size=80" alt="@2924661311" width="40"></a> [@2924661311](https://github.com/2924661311) | 📝 [问题 #48](https://github.com/Ares-X/Vira-Reader/issues/48) [问题 #74](https://github.com/Ares-X/Vira-Reader/issues/74) |

<!-- community-contributors:end -->

## 许可与致谢

新编写的 Vira Reader 代码采用 **[AGPL-3.0-or-later](LICENSE)**。上游与移植组件保留各自的许可及版权声明；来源、版本与许可见 [THIRD_PARTY.md](THIRD_PARTY.md)。

Vira Reader 借鉴 [SumatraPDF](https://github.com/sumatrapdfreader/sumatrapdf)，复用 MuPDF 和 SumatraPDF 的部分文档处理实现，并以 SwiftUI 和 AppKit 构建界面。感谢 [MuPDF](https://mupdf.com/) 及其他上游项目。Vira Reader 是独立开发的项目，功能覆盖与现有差异见[对标说明](docs/SUMATRA_PARITY.md)。
