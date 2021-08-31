# puts font_families.sort
@xx_large_font_size = screen_size(12 * Pango::SCALE)
@x_large_font_size = screen_size(10 * Pango::SCALE)
@large_font_size = screen_size(7 * Pango::SCALE)
@normal_font_size = screen_size(5 * Pango::SCALE)
@small_font_size = screen_size(4 * Pango::SCALE)
@x_small_font_size = screen_size(3.5 * Pango::SCALE)
@xx_small_font_size = screen_size(2.5 * Pango::SCALE)

@font_family = find_font_family('Titillium Web')
@monospace_font_family = 'Ricty Discord'

@default_headline_line_color = '#0B374D'
@default_headline_line_width = 8
@default_headline_line_expand = false

set_graffiti_color "blue"
set_graffiti_line_width 8

#@table_frame_color = "#ffffff"
#@table_fill_color = "#0f0428"
#@table_body_frame_color = "#ffffff"
#@table_body_fill_color = "#3f3468"
#@table_head_frame_color = "#ffffff"
#@table_head_fill_color = "#rf0428"


@preformatted_fill_color = '#ebe0ce'
# @preformatted_centering = true
@space = screen_y(1)

@image_slide_number_start_flag_color = "#FFB400"
@image_slide_number_goal_flag_color = "#FF2B22"

include_theme('default')

match Slide, HeadLine do |heads|
  heads.prop_set("size", @large_font_size)
  heads.prop_set("weight", "bold")
end
match Slide do |slides|
  slides.prop_set("foreground", "#0B374D")
end

@slide_headline_hide = true
match TitleSlide do |slides|
  slides.margin_left = 900
  slides.vertical_centering = true
  slides.prop_set "foreground", "#0B374D"
  slides.prop_set("weight", "bold")
end
match TitleSlide, Subtitle do |subtitle|
  subtitle.margin_top = -20
  subtitle.prop_set("size", @large_font_size)
end
match TitleSlide, Author do |author|
  author.margin_top = 50
  author.prop_set("weight", "normal")
end
match TitleSlide, Place do |place|
  place.prop_set("size", @small_font_size)
end
match TitleSlide, "*" do |elems|
  elems.horizontal_centering = false
end

# Cites
#match Slide do |slides|
#  slides.each do |slide|
#    if slide.match?(/Acknowledgement/)
#      slide.horizontal_centering = true
#    end
#  end
#end

@title_slide_background_image = 'images/takeout.000.png'
include_theme("title-slide-background-image")

@slide_background_image = 'images/takeout.001.png'
include_theme("slide-background-image")

#@slide_logo_image = 'images/mark48.png'
#include_theme('slide-logo')

@item_image = 'images/hamburger.png'

include_theme("default-item-mark")

add_image_path("rabbit-images")

slide_body = [Slide, Body]
item_list_item = [ItemList, ItemListItem]

indent = 70

match(*(slide_body + (item_list_item * 1))) do |items|
  name = "item1"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end

match(*(slide_body + (item_list_item * 2))) do |items|
  name = "item2"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end

match(*(slide_body + (item_list_item * 3))) do |items|
  name = "item3"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end

enum_list_item = [EnumList, EnumListItem]

match(*(slide_body + enum_list_item + item_list_item)) do |items|
  name = "enum-item1"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end

match(*(slide_body + enum_list_item + (item_list_item * 2))) do |items|
  name = "enum-item2"
  items.delete_pre_draw_proc_by_name(name)
  items.delete_post_draw_proc_by_name(name)
  draw_image_mark(items, @item_image, name, indent: indent)
end
