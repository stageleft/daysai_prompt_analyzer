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
        initial_data["menu"] = []
        initial_data["menu"].push({"menu1":["select1", "select2"]})
        initial_data["menu"].push({"menu2":["select1", "select2"]})
        initial_data["menu"].push({"menu3":["select1", "select2"]})
        initial_data["menu"].push({"menu4":["select1", "select2"]})
        initial_data["menu"].push({"menu5":["select1", "select2"]})
        File.open(filename, "w", 0666) { |f|
            f.puts JSON.pretty_generate(initial_data)
        }
    end
end
