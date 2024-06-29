# このリポジトリは何か？

[Days AI](https://dayseum-app.studio.site/ja) の個人的使用感をベースとして、Days AI公式テーマを勝手分析して、Stable Diffusionのプロンプトを想定する試みのメモ。

なお、以下の仮説において、 Stable Diffusionパラメータかどうかの判断は、NMKD Stable Diffusion GUI のUI要素により行っている。

## このリポジトリで想定する仮説（オフィシャルテーマ）

Days AI は、以下の文字列を結合したものをプロンプトとして表示している。

* うちの子を表すプロンプト
* オフィシャルテーマを表すプロンプト
  * 描画の風味については単一のDays AIモデル内に統合され、プロンプト指定によって出力可能と想定する
* オフィシャルテーマの「その他」入力部分
  * 極まれに、その他入力部分がないテーマがある。
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
* official_theme_list_jp.csv : Days AI アプリの公式テーマ（日本語）うち、「新着」表示ありテーマ
* unlisted_theme_list_jp.csv : Days AI アプリの公式テーマ（日本語）うち、「新着」表示なしテーマ
  * 基本的には、テーマ欄にて半角スペースにて検索すると、新着表示ありテーマに混ざって検索可能。
  * テーマなしは検索不可。偶然見えるテーマを拾って保存するしかない。
* template_generator_official_theme.rb : 上記ファイルより、公式テーマごとのテンプレートファイルを生成するスクリプト ※テンプレート作成の手間削減のためであり、別に生成しなくてもよい。
* uchinoko/*.json : うちの子（OC）
* official_theme/*.json : 公式テーマ
  * official_theme/*_icon/*.png : 公式テーマに用いられているアイコン。
    * ファイル名は xx_(prompt)_日本語説明.png の形式とする。xx部分は登場順のIDとする。prompt部分は Stable Diffusion 標準の i2t 機能である DeepBooru または Clip にてアイコンを解析させ、抽出したキーワードとする。
* iconcut.rb : アイコン切り抜きプログラム。上記 official_theme/*_icon/*.png の作成に用いる。
* template_collector_official_theme.rb : 上記 official_theme/*.json ファイル群よりワードを抽出しワードリストを生成するスクリプト。
* template_all_selection.json : template_collector_official_theme.rb により生成されたワードリスト。 template_generator_official_theme.rb で用いる。
* official_theme_list_jp.header.csv : template_collector_official_theme.rb により生成されたカテゴリリスト。 official_theme_list_jp.csv の更新時に参照する。
