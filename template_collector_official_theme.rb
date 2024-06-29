#! /usr/bin/ruby

require "csv"
require "json"

all_selection = {}
Dir.glob("official_theme/*.json") { |filename|
    # puts filename
    File.open(filename) { |f|
        selection = JSON.load(f)
        # puts JSON.pretty_generate(selection)
        selection["menu"].each_pair { |menu_name, selection|
            # puts JSON.pretty_generate(menu_name)
            # puts JSON.pretty_generate(selection)
            if all_selection["#{menu_name}"] == nil then
                all_selection["#{menu_name}"] = []
            end
            all_selection["#{menu_name}"].push(selection)
            all_selection["#{menu_name}"].flatten!
            all_selection["#{menu_name}"].uniq!
        }
    }
    # puts JSON.pretty_generate(all_selection)
    # puts
}

File.open("template_all_selection.json", "w", 0666) { |f|
    f.print JSON.pretty_generate(all_selection)
}

File.open("official_theme_list_jp.header.csv", "w", 0666) { |f|
    header_col = ["id", "テーマ名", "性別"]
    all_selection.each_key{|k|
        if k != "キャラクター" then
            header_col.push(k.sub(/（イラストイメージ）/, ''))
        end
    }
    f.print header_col.join(',')
}
