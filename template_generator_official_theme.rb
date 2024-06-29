#! /usr/bin/ruby

require "csv"
require "json"

all_selection = {}
File.open("template_all_selection.json") { |f|
    all_selection = JSON.load(f)
}
# puts all_selection

theme_list = {}
File.open("official_theme_list_jp.csv") {|f|
    theme_list_raw = CSV.new(f, **{encoding: 'BOM|UTF-8', headers: true})
    theme_list = theme_list_raw.to_a.map{|row| row.to_hash}
}
# puts theme_list

theme_list.each_entry{|row|
    id     = "#{row["id"]}"
    theme  = "#{row["テーマ名"]}"
    gender = "#{row["性別"]}"

    # temporally code start : row["id"] is nil now, force read.
    i = 0
    row.each_pair {|k,v|
        if i == 0 or k == "id" then
            id = v
            i = 1
        end            
    }
    # temporally code end

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
        row.each_pair {|k,v|
            if k != "id" and k != "テーマ名" and k != "性別" then
                if v == "Yes" or v == "Uncertain" then
                    menu.update({ "#{k}": all_selection[k]})
                end            
            end            
        }

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
}
