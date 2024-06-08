# このリポジトリは何か？

[Days AI](https://dayseum-app.studio.site/ja) の個人的使用感をベースとして、Days AI公式テーマを勝手分析して、Stable Diffusionのプロンプトを想定する試みのメモ。

なお、以下の仮説において、 Stable Diffusionパラメータかどうかの判断は、NMKD Stable Diffusion GUI のUI要素により行っている。

## このリポジトリで想定する仮説（オフィシャルテーマ）

Days AI は、以下の文字列を結合したものをプロンプトとして表示している。

* うちの子を表すプロンプト
* オフィシャルテーマを表すプロンプト
  * 描画の風味については単一のDays AIモデル内に統合され、プロンプト指定によって出力可能と想定する
* オフィシャルテーマの「その他」入力部分
* センシティブ判定は入力ワードで判定しており、出力画像では判定していない。

## このリポジトリで想定する仮説（テキストからつくる）

Days AI は、以下の文字列を結合したものをプロンプトとして表示している。

* キャラクター：うちの子を表すプロンプト、任意指定。
* 反映したい要素：以下の条件でワードを指定する。半角カンマ、または、改行区切り。
  * 日本語または英語の単語の一部。
  * サイコロメニューにて、日本語のワードをランダムで追加することも可能。

プロンプト以外の要素は以下と想定する。

* サイズ：無料版では５種類から指定。 → Resolution (Width x Height) と想定。これもStable Diffusionパラメータ。
* 除外したい要素：有料要素、説明は下記。
  * いらない要素をイラストから除外します → 率直に negative prompt と想定。これもStable Diffusionパラメータ。
* 詳細な設定：有料要素、説明は下記。
  * ステップ：イラストの書き込み量を設定できます → Generation Steps と想定。これもStable Diffusionパラメータ。
  * スケール：入力した要素をどれくらい反映するか設定できます → Prompt Guidance (CFG Scale) と想定。これもStable Diffusionパラメータ。

## このリポジトリで想定する仮説（画像からつくる）

* キャラクター：うちの子を表すプロンプト、任意指定。
* 作成方法：以下から選択。 Image Usage の４種類（Initialization Image (Img2Img), Inpainting with Mask, Inpainting with Text Description, Outpainting）の割当てか？
  * 全体画像：写真→イラストの変換、画風変換におすすめ
  * 構図固定：背景やキャラを書き換えたいときにおすすめ
  * 色の変換（有料のみ）：髪色や服装の色を変えたい時におすすめ
* ベース画像：
  * ベース画像をアップロード：ベース画像の指定。アルバムまたはカメラ。
  * ベース画像の反映率（小～大のゲージ） → Initialization Image (Img2Img) で指定可能な Image Strength (Influence) と想定。これもStable Diffusionパラメータ。
* 反映したい要素：「テキストからつくる」と同様にワードを指定する。

プロンプト以外の要素は以下と想定する。

* 除外したい要素：有料要素、説明は下記。
  * いらない要素をイラストから除外します → 率直に negative prompt と想定。これもStable Diffusionパラメータ。

## 共通の要素

* AIのスタイルとして、以下を選択可能。
  * Soft (V1)
  * Cool (V1)

## このリポジトリにおけるファイル・ディレクトリ説明一覧

* README.md : 本書
* official_theme_list_jp.csv : Days AI アプリの公式テーマ（日本語）
* template_generator_official_theme.rb : 上記ファイルより、公式テーマごとのテンプレートファイルを自動生成するスクリプト
* uchinoko/*.json : うちの子（OC）
* official_theme/*.json : 公式テーマ
