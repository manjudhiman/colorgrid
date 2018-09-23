class User < ApplicationRecord
  has_many :colorpalettes
  validates_presence_of :username,:ipaddress

  # Generates the color code with maximum count.
  #
  # Returns a string.
  def find_fav_color
    self.colorpalettes.group(:code).count.sort {|a1,a2| a2[1]<=>a1[1]}.first[0]
  end
end
