module HomeHelper

  def generate_tile(row, col)
    tile_info = get_tile_details(row, col)
      raw("<div onclick='toggleClass(this);' class='content'
         id='tile-#{row}_#{col}' #{style_attributes(tile_info)}></div>")
  end

  private

  def get_tile_details(row,col)
    Colorpalette.find_color_code(row,col)
  end


  def style_attributes(tile_info)
    "style='background-color: #{tile_info[0]}' title='#{tile_info[1]}'"
  end
end
