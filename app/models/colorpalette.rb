class Colorpalette < ApplicationRecord
  belongs_to :user
  validates_presence_of :code,:row,:column,:user_id

  # Returns an array of color code, username and time.
  # x: (Integer)row
  # y: (Integer) column
  #
  # Returns an array.
  def self.find_color_code(x, y)
    colorarray = []
    palette = Colorpalette.where(row: x, column: y).last
    colorarray = [palette.code,"#{palette.user.username} #{palette.find_time_stamp}"] if palette.present?
    colorarray
  end

  # Returns the timestamp in the format of dd-mm-yyyy hh-mm-ss.
  #
  # Returns a string.
  def find_time_stamp
    self.updated_at.strftime("%d-%m-%Y %H:%M:%S")
  end
end
