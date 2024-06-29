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
        menu = {}
        if (gender == "女性") then
            menu.update({
                "キャラクター": [
                    "うちの子(1,...)",
                    "ランダムキャラクター（女性）"
                ]
            })
        elsif (gender == "男性") then
            menu.update({
                "キャラクター": [
                    "うちの子(1,...)",
                    "ランダムキャラクター（男性）"
                ]
            })
        else
            menu.update({
                "キャラクター": [
                    "うちの子(1,...)",
                    "ランダムキャラクター（女性）",
                    "ランダムキャラクター（男性）"
                ]
            })
        end
        if ("#{row["スタイルの強さ"]}" == "Yes" or "#{row["スタイルの強さ"]}" == "Uncertain") then
            menu.update({
                "スタイルの強さ": [
                    "弱",
                    "中",
                    "強",
                ]
            })
        end
        if ("#{row["目的地"]}" == "Yes" or "#{row["目的地"]}" == "Uncertain") then
            menu.update({
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
            menu.update({
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
            menu.update({
                "表情": [
                    "笑顔",
                    "口を開けて笑う",
                    "大笑いする",
                    "無表情",
                    "泣く",
                    "号泣",
                    "ウィンク",
                    "目を閉じて笑う",
                    "ニヤニヤする",
                    "驚く",
                    "あくび",
                    "あくびする",
                    "あくびをする",
                    "恥ずかしい",
                    "恥ずかしがる",
                    "真剣",
                    "真剣な",
                    "舌出し",
                    "舌を出す",
                    "膨れっ面",
                    "怯える",
                    "見下す",
                    "赤面する",
                    "あせあせ",
                    "混乱する",
                    "軽蔑",
                    "軽蔑する",
                    "怒っている",
                    "怒る",
                    "取り乱す",
                    "酔っ払い",
                    "パニック",
                    "しかめっ面",
                    "ドヤ顔",
                    "不安顔",
                    "病んでる顔",
                    "考え事をする",
                    "嬉しい",
                    "悲しい",
                ]
            })
        end
        if ("#{row["服装"]}" == "Yes" or "#{row["服装"]}" == "Uncertain") then
            menu.update({
                "服装": [
                    "clothing_icon/01_kimono_着物.png",
                    "clothing_icon/02_miko_巫女服.png",
                    "シャツ",
                    "コート",
                    "セーター",
                    "フード付きパーカー",
                    "上品なドレス",
                    "セーラー服",
                    "制服",
                    "体操服",
                    "バスケットボール"            
                ]
            })
        end
        if ("#{row["服装Ex"]}" == "Yes" or "#{row["服装Ex"]}" == "Uncertain") then
            menu.update({
                "帽子": [
                    "なし",
                    "野球帽",
                    "ニット帽"
                ]
            })
            menu.update({
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
            menu.update({
                "上着": [
                    "なし",
                    "ジャケット",
                    "ジャージ",
                    "スタジャン",
                    "ボレロ",
                    "ファージャケット"
                ]
            })
            menu.update({
                "ボトムス": [
                    "ストレッチパンツ",
                    "ホットパンツ",
                    "バギーパンツ",
                    "デニムのホットパンツ",
                    "レギンス",
                    "スカート"
                ]
            })
            menu.update({
                "セーラー服の色（イラストイメージ）": [
                    "黒",
                    "白"
                ]
            })
            menu.update({
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
            menu.update({
                "ポーズ": [
                    "ポケットに手を入れる",
                    "座る",
                    "床に座る",
                    "足を組んで座る",
                    "しゃがむ",
                    "ピースピース",
                    "前屈みになる",
                    "剣を握る",
                    "剣を持つ",
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
                    "膝立ち",
                    "腕を上げる",
                    "握り拳",
                    "祈る",
                ]
            })
        end
        if ("#{row["背景"]}" == "Yes" or "#{row["背景"]}" == "Uncertain") then
            menu.update({
                "背景（イラストイメージ）": [
                    "place_icon/01_classroom_教室.png",
                    "place_icon/02_park_公園.png",
                    "place_icon/03_restaurant_食事処.png",
                    "place_icon/04_beach_砂浜.png",
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
                    "針葉樹林",
                    "森の中の泉",
                    "灰色のベッド",
                    "石の神殿",
                    "岩の砂漠",
                    "神殿の廃墟",
                ]
            })
        end
        if ("#{row["角度"]}" == "Yes" or "#{row["角度"]}" == "Uncertain") then
            menu.update({
                "角度": [
                    "ランダム",
                    "正面から",
                    "横から",
                    "向こうを見る",
                ]
            })
        end
=begin
        menu.update({
            "menu1": [
                "select1",
                "select2"
            ]
        })
=end
        initial_data["menu"] = menu
        File.open(filename, "w", 0666) { |f|
            f.print JSON.pretty_generate(initial_data)
        }
    end
end
