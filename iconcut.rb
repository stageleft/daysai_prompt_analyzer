#-*- coding: utf-8 -*-
# modified from https://github.com/stageleft/ekokari-tiermaker-png-generator.git
# usage:
# 1. take screenshot
# 2. set screenshots into iconcut_input_img directory
# 3. create icon directory if necessary. ex) official_theme/clothing_icon
# 4. execute:
#      ruby iconcut.rb <input_dir> <output_dir>
#        input_dir is from step 2.
#        output_dir is from step 3.
#      ex) ruby iconcut.rb iconcut_input_img official_theme/clothing_icon
# 5. select and remame output files as you like.
require 'cairo'

# setup conversion spec.
in_width = 1179
in_height = 2556

out_xpos = [97,435,773]
out_ypos = [690, 1028]
out_width = 308
out_height = 308

# functions
def trim(in_name, out_name, out_x, out_y, out_w, out_h)
    in_image  = Cairo::ImageSurface.from_png(in_name)
    out_image = Cairo::ImageSurface.new(out_w, out_h)
    out_canvas = Cairo::Context.new(out_image)
    out_canvas.set_source(in_image, 0-out_x, 0-out_y)
    out_canvas.fill do
        out_canvas.rectangle(0, 0, out_w, out_h)
    end
    out_image.write_to_png(out_name)
end

# execute
if ARGV.size != 2 then
    puts "ruby convert.rb <input_dir> <output_dir>"
    exit 1
end

in_dir = ARGV[0]
out_dir = ARGV[1]

Dir.glob("#{in_dir}/*").each{|in_name|
    out_name = in_name.downcase.gsub("#{in_dir}", "#{out_dir}")
    for i in 0...out_xpos.size do
        for j in 0...out_ypos.size do
            trim(in_name, out_name.gsub(".png", "_#{j+1}_#{i+1}.png"), out_xpos[i], out_ypos[j], out_width, out_height)
        end
    end
}

exit 0