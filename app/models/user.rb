class User < ApplicationRecord
  has_many :colorpalettes
  validates_presence_of :username,:ipaddress

  def find_fav_color
    self.colorpalettes.group(:code).count.sort {|a1,a2| a2[1]<=>a1[1]}.first[0]
  end
end
