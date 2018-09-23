class Colorpalette < ApplicationRecord
  belongs_to :user
  validates_presence_of :code,:row,:column,:user_id

  def self.find_color_code(x,y)
    result = []
    palette = Colorpalette.where(row: x,column: y).last
    result = [palette.code,"#{palette.user.username} #{palette.find_time_stamp}"] if palette.present?
    result
  end

  def find_time_stamp
    self.updated_at.strftime("%d-%m-%Y %H:%M:%S")
  end
end
