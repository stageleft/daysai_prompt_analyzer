#! /usr/bin/ruby

require "csv"
require "json"

CSV.foreach("official_theme_list_jp.csv", **{encoding: 'BOM|UTF-8', headers: true}) do |row|
    filename = "#{row["id"]}"
    id     = "#{row["id"]}"
    theme  = "#{row["テーマ名"]}"
    gender = "#{row["性別"]}"

    filename = "official_theme/#{id}_#{theme}（#{gender}）.json"
    if FileTest.exist?(filename) then
        true # nop : p filename + " exists. skip"
    else
        p filename + " not exists. create."
        initial_data = {}
        initial_data["theme"] = "#{theme}"
        menu = []
        if (gender == "女性") then
            menu.push({
                "キャラクター": [
                    "うちの子(1,...)",
                    "ランダムキャラクター（女性）"
                ]
            })
        elsif (gender == "男性") then
            menu.push({
                "キャラクター": [
                    "うちの子(1,...)",
                    "ランダムキャラクター（男性）"
                ]
            })
        else
            menu.push({
                "キャラクター": [
                    "うちの子(1,...)",
                    "ランダムキャラクター（女性）",
                    "ランダムキャラクター（男性）"
                ]
            })
        end
        if ("#{row["目的地"]}" == "Yes" or "#{row["目的地"]}" == "Uncertain") then
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
        end
        if ("#{row["状況"]}" == "Yes" or "#{row["状況"]}" == "Uncertain") then
            menu.push({
                "状況": [
                    "晴れ☀",
                    "曇り☁",
                    "雨☔",
                    "夕日🌇",
                    "夜景🌃"
                ]
            })
        end
        if ("#{row["表情"]}" == "Yes" or "#{row["表情"]}" == "Uncertain") then
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
                    "あくびする",
                    "恥ずかしがる",
                    "真剣",
                    "真剣な",
                    "舌出し",
                    "舌を出す",
                    "膨れっ面",
                    "怯える",
                    "見下す",
                    "赤面する",
                ]
            })
        end
        if ("#{row["服装"]}" == "Yes" or "#{row["服装"]}" == "Uncertain") then
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
        end
        if ("#{row["服装Ex"]}" == "Yes" or "#{row["服装Ex"]}" == "Uncertain") then
            menu.push({
                "帽子": [
                    "なし",
                    "野球帽",
                    "ニット帽"
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
        end
        if ("#{row["ポーズ"]}" == "Yes" or "#{row["ポーズ"]}" == "Uncertain") then
            menu.push({
                "ポーズ": [
                    "ポケットに手を入れる",
                    "座る",
                    "床に座る",
                    "しゃがむ",
                    "ピースピース",
                    "前屈みになる",
                    "剣を握る",
                    "杖を持つ",
                    "銃を持つ",
                    "花束を持つ",
                    "注射器を持つ",
                    "スクールバッグを持つ",
                    "ぬいぐるみを持つ",
                    "振り向く",
                    "振り返る",
                    "胸に手を置く",
                    "手を口に添える",
                    "宙に浮く",
                    "キャンディーを持つ",
                    "横たわる",
                    "横になる",
                ]
            })
        end
        if ("#{row["背景"]}" == "Yes" or "#{row["背景"]}" == "Uncertain") then
            menu.push({
                "背景（イラストイメージ）": [
                    "落書きの壁",
                    "夜の繁華街",
                    "ビルの屋上",
                    "教室",
                    "鉄条網",
                    "ダブルベッド",
                    "雷雲",
                    "遺跡とマグマ",
                    "西洋風の部屋",
                    "病室のベッド",
                    "戦場",
                    "廃墟",
                    "夜のゲームセンター",
                    "藤の花",
                    "紅葉",
                    "和座敷",
                ]
            })
        end
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
