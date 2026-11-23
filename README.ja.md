<p align="center">
  <img src="docs/images/vira-reader-icon.png" width="88" height="88" alt="">
</p>

<h1 align="center">Vira Reader</h1>

<p align="center">
  <strong>電子書籍、コミック、PDF、画像、Markdown を読める軽量な Mac ネイティブリーダー。</strong>
</p>

<p align="center">macOS 13 以降 · Apple シリコン · 無料・オープンソース</p>

<p align="center">
  <a href="https://github.com/Ares-X/Vira-Reader/releases/latest"><strong>Mac 版をダウンロード</strong></a> ·
  <a href="#対応形式">対応形式</a> ·
  <a href="https://github.com/Ares-X/Vira-Reader/releases">リリースノート</a>
</p>

<p align="center">
  <a href="README.md">English</a> ·
  <a href="README.zh-CN.md">简体中文</a> ·
  <a href="README.zh-TW.md">繁體中文</a> ·
  <strong>日本語</strong>
</p>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/images/reader-dark.png">
    <img src="docs/images/reader-light.png" width="850" alt="Vira Reader で Markdown の読書メモと目次を並べて表示">
  </picture>
</p>

## インストールして読書を始める

1. [最新リリース](https://github.com/Ares-X/Vira-Reader/releases/latest)から、ファイル名が `-macOS-arm64.zip` で終わるアプリの ZIP をダウンロードして展開します。
2. **Vira Reader.app** を **アプリケーション** フォルダに移動し、開きます。
3. **⌘O** でファイルを選ぶか、ウィンドウにファイルをドラッグ＆ドロップします。**⌘F** で本文を検索できます。

公開ビルドはメンテナーの自己署名証明書 **Ares-X Code Signing** を使っており、Apple の公証を受けていません。初回起動時に macOS がブロックし、ダウンロード元を信頼できる場合は、**システム設定 → プライバシーとセキュリティ → このまま開く** を選びます。[Apple の手順](https://support.apple.com/ja-jp/102445)

**Help → 更新を確認…** から Sparkle で更新できます。設定で自動確認も有効にできます。リリースページには SHA-256 チェックサムと対応するソースコードを掲載しています。

## 読書のための機能

- **Finder から開いて、続きから読む。** Mac 標準のウィンドウやタブを使い、最近使った書類や保存された読書位置に戻れます。
- **読みやすいレイアウトを選ぶ。** 1 ページ、連続スクロール、見開き表示を切り替えられます。5 種類の組み込みテーマやカスタム配色を使えます。リフロー型の文書ではフォント、行間、余白も調整できます。
- **検索して、読みたい章へ移動する。** 全文検索、目次、サムネイル、ブックマークを使えます。コミックアーカイブをフォルダ階層からたどり、EPUB やコミックを Finder のクイックルックでプレビューできます。
- **PDF のフォームと注釈。** フォーム入力や注釈の編集、ページの抽出・結合ができます。編集するには **Enable Editing** を選びます。**コピーを保存…** は編集可能なフォームと注釈を保持します。**PDFを書き出す…** は閲覧用の静的なコピーを作ります。
- **読み上げ、印刷、書き出し。** システム音声による読み上げ、macOS の印刷パネルからの印刷、PDF への書き出しに対応します。利用できる操作はファイル形式や文書の権限によって異なります。

[読書操作とショートカット](docs/READER_CONTROLS.md) · [SyncTeX 連携](docs/SYNCTEX.md) · [Markdown サンプル文書](docs/demos/Reading-Notes.md)

<details>
<summary>読書テーマと最近使った書類</summary>

![Vira Reader の 5 種類の組み込み読書テーマ](docs/images/themes.png)

![Vira Reader のホーム画面に表示された最近使った書類](docs/images/home-light.png)

</details>

## 対応形式

| 種類 | 形式 |
| --- | --- |
| PDF と固定ページ | PDF、XPS / OXPS、SVG、DjVu |
| 電子書籍 | EPUB、MOBI、AZW、PRC、FB2 / 圧縮 FB2 |
| コミックと画像 | CBZ、CBR、CB7、CBT、画像フォルダ、GIF、TIFF、JPEG XL など一般的な画像形式 |
| テキストと Web | Markdown、HTML / XHTML、CHM、TXT などのプレーンテキスト、TCR |
| その他の対応形式 | PDF 対応 AI、P7M エンベロープ、LIT |
| 追加ソフトウェアが必要 | PostScript / EPS：Ghostscript を別途インストールしてください |

対応状況はファイルのバリエーションによって異なります。Vira Reader は OCR と DRM の解除には対応していません。スキャンしたページのテキスト検索には、既存のテキストレイヤーが必要です。

[形式とエンジンの対応状況](docs/SUMATRA_ENGINE_PARITY.md) · [Markdown の描画](docs/MARKDOWN_RENDERER_DECISION.md) · [スキャン PDF の表示](docs/SCANNED_PDF_DISPLAY.md)

## ソースからビルド

macOS、Apple Swift ツールチェーンと macOS SDK、CMake が必要です。初回ビルドでは、バージョンを固定した依存ライブラリと Sparkle をダウンロードします。

```sh
git clone https://github.com/Ares-X/Vira-Reader.git
cd Vira-Reader
./scripts/build-app.sh --release
open "dist/Vira Reader.app"
```

`./scripts/run-dev.sh` で開発版をビルドして起動できます。ローカルビルドにはアドホック署名を使用します。[ローカルチェック](scripts/check-source.sh) · [リリース手順](docs/RELEASE_ACTIONS.md)

## 貢献と翻訳

バグ報告、機能の提案、プルリクエストを歓迎します。バグ報告には、可能であれば macOS と Vira Reader のバージョン、ファイル形式、再現手順、共有可能なサンプルを添えてください。[GitHub Issues](https://github.com/Ares-X/Vira-Reader/issues)

アプリは 25 の言語・地域向けに翻訳されており、翻訳の改善も歓迎します。README の翻訳を更新するときは、英語版を基準にセクションの順序と共通情報を揃えてください。[言語対応と検証](docs/LANGUAGE_SUPPORT.md)・[英語版 README](README.md)

<!-- community-contributors:start -->
## コミュニティ貢献者

Issue の報告、コードの提供、レビューを通じて Vira Reader を改善してくださる皆さんに感謝します。この一覧は対象の GitHub Issue とマージ済み Pull Request から自動更新されます。[掲載ルール](docs/COMMUNITY_CONTRIBUTORS.md)をご覧ください。

| 貢献者 | 貢献内容 |
| --- | --- |
| <a href="https://github.com/HomeStarRunnerTron"><img src="https://github.com/HomeStarRunnerTron.png?size=80" alt="@HomeStarRunnerTron" width="40"></a> [@HomeStarRunnerTron](https://github.com/HomeStarRunnerTron) | 📝 [Issue #31](https://github.com/Ares-X/Vira-Reader/issues/31) [Issue #42](https://github.com/Ares-X/Vira-Reader/issues/42) [Issue #68](https://github.com/Ares-X/Vira-Reader/issues/68) [Issue #69](https://github.com/Ares-X/Vira-Reader/issues/69) [Issue #82](https://github.com/Ares-X/Vira-Reader/issues/82) [Issue #118](https://github.com/Ares-X/Vira-Reader/issues/118) [Issue #137](https://github.com/Ares-X/Vira-Reader/issues/137) [Issue #158](https://github.com/Ares-X/Vira-Reader/issues/158) [Issue #165](https://github.com/Ares-X/Vira-Reader/issues/165) |
| <a href="https://github.com/2924661311"><img src="https://github.com/2924661311.png?size=80" alt="@2924661311" width="40"></a> [@2924661311](https://github.com/2924661311) | 📝 [Issue #48](https://github.com/Ares-X/Vira-Reader/issues/48) [Issue #74](https://github.com/Ares-X/Vira-Reader/issues/74) |

<!-- community-contributors:end -->

## ライセンスと謝辞

Vira Reader の新規コードは **[AGPL-3.0-or-later](LICENSE)** でライセンスされています。上流から取り込んだコンポーネントと移植したコンポーネントは、それぞれのライセンスと著作権表示を引き継ぎます。出典、バージョン、ライセンスは [THIRD_PARTY.md](THIRD_PARTY.md) を参照してください。

[SumatraPDF](https://github.com/sumatrapdfreader/sumatrapdf) に着想を得て、Vira Reader は MuPDF と SumatraPDF の文書処理の一部を、SwiftUI と AppKit のインターフェースで再利用しています。[MuPDF](https://mupdf.com/) とその他の上流プロジェクトに感謝します。Vira Reader は独立して開発されており、機能の対応状況と残る差異は[比較資料](docs/SUMATRA_PARITY.md)に記載しています。
