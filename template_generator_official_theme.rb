#! /usr/bin/ruby

require "csv"
require "json"

CSV.foreach("official_theme_list_jp.csv", {encoding: 'BOM|UTF-8', headers: true}) do |row|
    filename = "#{row["id"]}"
    id     = "#{row["id"]}"
    theme  = "#{row["theme_name_jp"]}"
    gender = "#{row["gender"]}"

    filename = "official_theme/#{id}_#{theme}（#{gender}）.json"
    if FileTest.exist?(filename) then
        p filename + " exists. skip"
    else
        p filename + " not exists. create."
        initial_data = {}
        initial_data["theme"] = "#{theme}"
        menu = []
        menu.push({
            "キャラクター": [
                "うちの子(1,...)",
                "ランダムキャラクター（女性）",
                "ランダムキャラクター（男性）"
            ]
        })
        menu.push({
            "目的地": [
                "イタリア🇮🇹 - コロッセオ",
                "イタリア🇮🇹 - ベネチア",
                "スペイン🇪🇸 - セビーリャ",
                "ギリシャ🇬🇷 - アテネ",
                "ポルトガル🇵🇹 - アルガルヴェ",
                "マルタ🇲🇹 - バレッタ"
            ]
        })
        menu.push({
            "状況": [
                "晴れ☀",
                "曇り☁",
                "雨☔",
                "夕日🌇",
                "夜景🌃"
            ]
        })
        menu.push({
            "表情": [
                "笑顔",
                "無表情",
                "泣く",
                "ウィンク",
                "目を閉じて笑う",
                "ニヤニヤする",
                "驚く",
                "あくびをする",
                "恥ずかしがる",
                "真剣",
                "舌出し",
                "膨れっ面"
            ]
        })
        menu.push({
            "帽子": [
                "なし",
                "野球帽",
                "ニット帽"
            ]
        })
        menu.push({
            "服装": [
                "シャツ",
                "コート",
                "セーター",
                "フード付きパーカー",
                "上品なドレス",
                "セーラー服"
            ]
        })
        menu.push({
            "トップス": [
                "シャツ",
                "へそ出しTシャツ",
                "フード付きパーカー",
                "へそ出しフード付きパーカー",
                "タートルネックシャツ",
                "へそ出しタートルネックシャツ",
                "キャミソール",
                "ホルターネックドレス",
                "タンクトップ"
            ]
        })
        menu.push({
            "上着": [
                "なし",
                "ジャケット",
                "ジャージ",
                "スタジャン",
                "ボレロ",
                "ファージャケット"
            ]
        })
        menu.push({
            "ボトムス": [
                "ストレッチパンツ",
                "ホットパンツ",
                "バギーパンツ",
                "デニムのホットパンツ",
                "レギンス",
                "スカート"
            ]
        })
        menu.push({
            "セーラー服の色（イラストイメージ）": [
                "黒",
                "白"
            ]
        })
        menu.push({
            "ネッカーチーフの色（イラストイメージ）": [
                "黒",
                "白",
                "赤",
                "青",
                "黄",
                "ピンク",
                "緑",
                "紫"
            ]
        })
        menu.push({
            "ポーズ": [
                "ポケットに手を入れる",
                "床に座る",
                "しゃがむ",
                "ピースピース",
                "前屈みになる",
                "銃を持つ",
                "座る",
                "スクールバッグを持つ",
                "振り向く",
                "旨に手を置く",        
            ]
        })
        menu.push({
            "背景（イラストイメージ）": [
                "落書きの壁",
                "夜の繁華街",
                "ビルの屋上",
                "教室",
                "鉄条網",
                "ダブルベッド",
            ]
        })
        menu.push({
            "menu1": [
                "select1",
                "select2"
            ]
        })
        menu.push({
            "menu2": [
                "select1",
                "select2"
            ]
        })
        initial_data["menu"] = menu
        File.open(filename, "w", 0666) { |f|
            f.puts JSON.pretty_generate(initial_data)
        }
    end
end
