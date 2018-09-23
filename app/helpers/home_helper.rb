module HomeHelper

  # Generates the tiles
  # row: (Integer) x-axis
  # column: (Integer) y-axis
  #
  # Returns the div.
  def generate_tile(row, column)
    tile_info = get_tile_details(row, column)
      raw("<div onclick='toggleClass(this);' class='content'
         id='tile-#{row}_#{column}' #{style_attributes(tile_info)}></div>")
  end

  private

  # Internal: Returns the color code for the user
  # row: Integer
  # column: Integer
  #
  # Returns an array.
  def get_tile_details(row, column)
    Colorpalette.find_color_code(row, column)
  end

  # Internal: Returns the string containing the style and title
  # tile_info: String containing color code and user
  #
  # Returns a string
  def style_attributes(tile_info)
    "style='background-color: #{tile_info[0]}' title='#{tile_info[1]}'"
  end
end
