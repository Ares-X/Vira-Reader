<p align="center">
  <img src="docs/images/vira-reader-icon.png" width="88" height="88" alt="">
</p>

<h1 align="center">Vira Reader</h1>

<p align="center"><strong>A lightweight, native Mac reader for ebooks, comics, PDFs, images, and Markdown.</strong></p>

<p align="center">macOS 13 or later · Apple silicon · Free and open source</p>

<p align="center">
  <a href="https://github.com/Ares-X/Vira-Reader/releases/latest"><strong>Download for Mac</strong></a>
  · <a href="#supported-formats">Supported formats</a>
  · <a href="https://github.com/Ares-X/Vira-Reader/releases">Release notes</a>
</p>

<p align="center">
  <strong>English</strong>
  · <a href="README.zh-CN.md">简体中文</a>
  · <a href="README.zh-TW.md">繁體中文</a>
  · <a href="README.ja.md">日本語</a>
</p>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/images/reader-dark.png">
    <img src="docs/images/reader-light.png" width="850" alt="Vira Reader showing a Markdown document beside its table of contents">
  </picture>
</p>

## Install and start reading

1. Download the app ZIP ending in **-macOS-arm64.zip** from the [latest release](https://github.com/Ares-X/Vira-Reader/releases/latest).
2. Unzip it and move **Vira Reader.app** to **Applications**.
3. Open the app and press **⌘O** or drop in a file. Use **⌘F** to search its text.

The app uses the maintainer’s self-signed **Ares-X Code Signing** certificate and has no Apple notarization. If macOS blocks the first launch and you trust the download, choose **System Settings → Privacy & Security → Open Anyway**. [Apple’s instructions](https://support.apple.com/en-us/102445)

Use **Help → Check for Updates** to get new versions through Sparkle, or enable automatic checks in Settings. The release page includes SHA-256 checksums and corresponding source code.

## Made for reading

- **Open from Finder and pick up where you left off.** Use native Mac windows or tabs, and return to recent files and saved reading positions.
- **Read a page, scroll continuously, or open a spread.** Choose among five built-in themes or customize colors. Adjust the font, line spacing, and margins for reflowable text.
- **Find a passage or jump to a chapter.** Use full-text search, contents, thumbnails, and bookmarks. Browse comic archives by their folder structure and preview EPUBs and comics in Finder with Quick Look.
- **Work with PDFs in the reader.** Fill forms, add annotations, extract or merge pages, and save changes after choosing **Enable Editing**. **Save a Copy** preserves editable forms and annotations. **Export PDF** creates a static copy.
- **Listen, print, or export.** Use macOS speech for text or selections and the system print panel for printing. Available actions depend on the file format and permissions.

[Reading controls and shortcuts](docs/READER_CONTROLS.md) · [SyncTeX integration](docs/SYNCTEX.md) · [Sample Markdown document](docs/demos/Reading-Notes.md)

<details>
<summary>Reading themes and recent documents</summary>

![Five built-in reading themes](docs/images/themes.png)

![Vira Reader Home showing a recent document](docs/images/home-light.png)

</details>

## Supported formats

| Type | Formats |
| --- | --- |
| PDF and fixed pages | PDF, XPS / OXPS, SVG, DjVu |
| Ebooks | EPUB, MOBI, AZW, PRC, FB2 / compressed FB2 |
| Comics and images | CBZ, CBR, CB7, CBT, image folders; common image formats including GIF, TIFF and JPEG XL |
| Text and web | Markdown, HTML / XHTML, CHM, TXT and related plain text, TCR |
| Other compatible formats | PDF-compatible AI, P7M envelopes, LIT |
| Requires additional software | PostScript / EPS: install Ghostscript separately |

Format support depends on the file variant. Text search in scanned pages requires an existing text layer. OCR and DRM removal are unavailable.

[Format and engine coverage](docs/SUMATRA_ENGINE_PARITY.md) · [Markdown rendering](docs/MARKDOWN_RENDERER_DECISION.md) · [Scanned PDF display](docs/SCANNED_PDF_DISPLAY.md)

## Build from source

You’ll need macOS, the Apple Swift toolchain and macOS SDK, and CMake. The first build downloads pinned native dependencies and Sparkle.

```sh
git clone https://github.com/Ares-X/Vira-Reader.git
cd Vira-Reader
./scripts/build-app.sh --release
open "dist/Vira Reader.app"
```

Use `./scripts/run-dev.sh` to build and launch a development copy. Local builds are ad-hoc signed. [Local checks](scripts/check-source.sh) · [Release procedure](docs/RELEASE_ACTIONS.md)

## Contribute and translate

Share your macOS and Vira Reader versions, file format, and steps to reproduce a problem. Include a shareable sample if possible. [Report a bug or suggest a feature](https://github.com/Ares-X/Vira-Reader/issues)

The app offers 25 interface language and region options. Native-speaker reviews are welcome. Keep all four README editions in sync when changing shared information. [Language support](docs/LANGUAGE_SUPPORT.md)

<!-- community-contributors:start -->
## Community contributors

Thanks to everyone improving Vira Reader through issue reports, code, and reviews. This list is automatically generated from eligible GitHub issues and merged pull requests. See the [recognition rules](docs/COMMUNITY_CONTRIBUTORS.md).

| Contributor | Contributions |
| --- | --- |
| <a href="https://github.com/HomeStarRunnerTron"><img src="https://github.com/HomeStarRunnerTron.png?size=80" alt="@HomeStarRunnerTron" width="40"></a> [@HomeStarRunnerTron](https://github.com/HomeStarRunnerTron) | 📝 [Issue #31](https://github.com/Ares-X/Vira-Reader/issues/31) [Issue #42](https://github.com/Ares-X/Vira-Reader/issues/42) [Issue #68](https://github.com/Ares-X/Vira-Reader/issues/68) [Issue #69](https://github.com/Ares-X/Vira-Reader/issues/69) [Issue #82](https://github.com/Ares-X/Vira-Reader/issues/82) [Issue #118](https://github.com/Ares-X/Vira-Reader/issues/118) [Issue #137](https://github.com/Ares-X/Vira-Reader/issues/137) [Issue #158](https://github.com/Ares-X/Vira-Reader/issues/158) [Issue #165](https://github.com/Ares-X/Vira-Reader/issues/165) |
| <a href="https://github.com/2924661311"><img src="https://github.com/2924661311.png?size=80" alt="@2924661311" width="40"></a> [@2924661311](https://github.com/2924661311) | 📝 [Issue #48](https://github.com/Ares-X/Vira-Reader/issues/48) [Issue #74](https://github.com/Ares-X/Vira-Reader/issues/74) |

<!-- community-contributors:end -->

## License and acknowledgments

New Vira Reader code is licensed under **[AGPL-3.0-or-later](LICENSE)**. Upstream and ported components retain their own licenses and copyright notices; see [THIRD_PARTY.md](THIRD_PARTY.md) for sources, versions and licenses.

Inspired by [SumatraPDF](https://github.com/sumatrapdfreader/sumatrapdf), Vira Reader reuses MuPDF and parts of SumatraPDF's document handling with a SwiftUI and AppKit interface. Thanks to [MuPDF](https://mupdf.com/) and the other upstream projects. Vira Reader is independently developed; the [reference notes](docs/SUMATRA_PARITY.md) describe feature coverage and remaining differences.
