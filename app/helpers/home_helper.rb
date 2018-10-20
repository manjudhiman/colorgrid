require 'pry'
module HomeHelper

  # Generates the tiles
  # palettes: palettes containing array of colorpalettes.
  # row: (Integer) x-axis
  # column: (Integer) y-axis
  #
  # Returns the div.
  def generate_tile(palettes, row, column)
    row_palettes= palettes.group_by(&:row)
    tile_info = []
    row_palette = row_palettes[row.to_i]
    if row_palette
     column_palette = row_palette.group_by(&:column)[column.to_i]
     if column_palette
       column_palette = column_palette.last
       tile_info = [column_palette.code,"#{column_palette.user.username} #{column_palette.find_time_stamp}"]
     end
    end

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
