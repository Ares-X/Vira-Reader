<p align="center">
  <img src="docs/images/vira-reader-icon.png" width="88" height="88" alt="">
</p>

<h1 align="center">Vira Reader</h1>

<p align="center"><strong>原生 macOS 閱讀器，輕鬆閱讀電子書、漫畫、PDF、圖片和 Markdown。</strong></p>

<p align="center">macOS 13 或以上版本 · Apple 晶片 · 免費開源</p>

<p align="center">
  <a href="https://github.com/Ares-X/Vira-Reader/releases/latest"><strong>下載 Mac 版</strong></a>
  · <a href="#支援的格式">支援格式</a>
  · <a href="https://github.com/Ares-X/Vira-Reader/releases">版本說明</a>
</p>

<p align="center">
  <a href="README.md">English</a>
  · <a href="README.zh-CN.md">简体中文</a>
  · <strong>繁體中文</strong>
  · <a href="README.ja.md">日本語</a>
</p>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/images/reader-dark.png">
    <img src="docs/images/reader-light.png" width="850" alt="Vira Reader 的 Markdown 閱讀畫面，左側為目錄">
  </picture>
</p>

## 安裝並開始閱讀

1. 從[最新版本](https://github.com/Ares-X/Vira-Reader/releases/latest)下載檔名以 **-macOS-arm64.zip** 結尾的安裝檔。
2. 解壓縮後，將 **Vira Reader.app** 移至「應用程式」。
3. 開啟 App，按 **⌘O** 或直接拖入檔案。按 **⌘F** 搜尋內文。

App 使用維護者的 **Ares-X Code Signing** 自簽憑證，未經 Apple 公證。若 macOS 阻擋首次開啟，且你確定下載來源可信，可前往「系統設定 → 隱私權與安全性 → 強制打開」。[Apple 官方說明](https://support.apple.com/zh-tw/102445)

選擇「Help → 檢查是否有更新…」即可透過 Sparkle 取得新版，也可在設定中啟用自動檢查。發行頁提供 SHA-256 檢查碼與對應的原始碼。

## 專為閱讀打造

- **從 Finder 開啟，接續上次閱讀。** 使用原生 Mac 視窗或分頁，快速回到最近開啟的檔案和儲存的閱讀位置。
- **依閱讀習慣調整版面。** 支援單頁、連續捲動與雙頁閱讀。可選擇五種內建主題或自訂配色，並調整可重排文字的字體、行距和邊界。
- **找段落、跳章節。** 使用全文搜尋、目錄、縮圖和書籤。漫畫壓縮檔可依資料夾層級瀏覽，EPUB 與漫畫支援 Finder「快速查看」。
- **直接處理 PDF。** 選擇「啟用編輯」後，即可填寫表單、新增註解、擷取或合併頁面，並儲存修改。「儲存副本」保留可編輯的表單與註解。「輸出 PDF」會建立靜態副本。
- **朗讀、列印或輸出。** 使用 macOS 系統語音朗讀文字或選取範圍，也可透過系統列印面板列印。可用操作取決於檔案格式與權限。

[閱讀控制項與快速鍵](docs/READER_CONTROLS.md) · [SyncTeX 整合](docs/SYNCTEX.md) · [Markdown 範例文件](docs/demos/Reading-Notes.md)

<details>
<summary>閱讀主題與最近開啟的文件</summary>

![五種內建閱讀主題](docs/images/themes.png)

![Vira Reader 首頁中的最近文件](docs/images/home-light.png)

</details>

## 支援的格式

| 類型 | 格式 |
| --- | --- |
| PDF 與固定版面 | PDF、XPS / OXPS、SVG、DjVu |
| 電子書 | EPUB、MOBI、AZW、PRC、FB2 / 壓縮 FB2 |
| 漫畫與圖片 | CBZ、CBR、CB7、CBT、圖片資料夾；常見圖片格式，包括 GIF、TIFF 和 JPEG XL |
| 文字與網頁 | Markdown、HTML / XHTML、CHM、TXT 等純文字格式、TCR |
| 其他相容格式 | PDF 相容的 AI、P7M 封裝檔、LIT |
| 需要額外軟體 | PostScript / EPS：請另外安裝 Ghostscript |

支援範圍視實際檔案而定。掃描頁面需有文字層才能搜尋。App 未提供 OCR 或 DRM 移除功能。

[格式與引擎支援範圍](docs/SUMATRA_ENGINE_PARITY.md) · [Markdown 顯示方式](docs/MARKDOWN_RENDERER_DECISION.md) · [掃描 PDF 顯示](docs/SCANNED_PDF_DISPLAY.md)

## 從原始碼建置

需要 macOS、Apple Swift 工具鏈、macOS SDK 與 CMake。首次建置會下載固定版本的原生相依套件與 Sparkle。

```sh
git clone https://github.com/Ares-X/Vira-Reader.git
cd Vira-Reader
./scripts/build-app.sh --release
open "dist/Vira Reader.app"
```

執行 `./scripts/run-dev.sh` 即可建置並開啟開發版。本機建置使用臨時簽署。[本機檢查](scripts/check-source.sh) · [發行流程](docs/RELEASE_ACTIONS.md)

## 參與貢獻與翻譯

回報時請提供 macOS 和 Vira Reader 的版本、檔案格式與重現步驟。若方便，請附上可公開分享的範例檔。[回報問題或提出建議](https://github.com/Ares-X/Vira-Reader/issues)

App 提供 25 種介面語言和地區選項，歡迎母語使用者協助校訂。更新 README 的共用資訊時，請同步維護四種語言版本。[語言支援](docs/LANGUAGE_SUPPORT.md)

<!-- community-contributors:start -->
## 社群貢獻者

感謝透過問題回報、程式碼與審查協助改進 Vira Reader 的每一位貢獻者。此名單依符合條件的 GitHub Issue 與已合併的 Pull Request 自動更新。詳見[列入規則](docs/COMMUNITY_CONTRIBUTORS.md)。

| 貢獻者 | 貢獻紀錄 |
| --- | --- |
| <a href="https://github.com/HomeStarRunnerTron"><img src="https://github.com/HomeStarRunnerTron.png?size=80" alt="@HomeStarRunnerTron" width="40"></a> [@HomeStarRunnerTron](https://github.com/HomeStarRunnerTron) | 📝 [問題 #31](https://github.com/Ares-X/Vira-Reader/issues/31) [問題 #42](https://github.com/Ares-X/Vira-Reader/issues/42) [問題 #68](https://github.com/Ares-X/Vira-Reader/issues/68) [問題 #69](https://github.com/Ares-X/Vira-Reader/issues/69) [問題 #82](https://github.com/Ares-X/Vira-Reader/issues/82) [問題 #118](https://github.com/Ares-X/Vira-Reader/issues/118) [問題 #137](https://github.com/Ares-X/Vira-Reader/issues/137) [問題 #158](https://github.com/Ares-X/Vira-Reader/issues/158) [問題 #165](https://github.com/Ares-X/Vira-Reader/issues/165) |
| <a href="https://github.com/2924661311"><img src="https://github.com/2924661311.png?size=80" alt="@2924661311" width="40"></a> [@2924661311](https://github.com/2924661311) | 📝 [問題 #48](https://github.com/Ares-X/Vira-Reader/issues/48) [問題 #74](https://github.com/Ares-X/Vira-Reader/issues/74) |

<!-- community-contributors:end -->

## 授權與致謝

Vira Reader 新增的程式碼採用 **[AGPL-3.0-or-later](LICENSE)** 授權。上游及移植的元件保留各自的授權與著作權聲明；來源、版本和授權資訊請參閱 [THIRD_PARTY.md](THIRD_PARTY.md)。

Vira Reader 的設計受到 [SumatraPDF](https://github.com/sumatrapdfreader/sumatrapdf) 啟發，沿用 MuPDF 和 SumatraPDF 的部分文件處理程式，並以 SwiftUI 和 AppKit 打造介面。感謝 [MuPDF](https://mupdf.com/) 及其他上游專案。Vira Reader 為獨立開發；功能涵蓋範圍與尚存差異請參閱[對照說明](docs/SUMATRA_PARITY.md)。
