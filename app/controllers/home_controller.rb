class HomeController < ApplicationController
  before_action :set_username

  def index
    @palettes = Colorpalette.includes(:user).all
  end

  # Internal: Set the user if not present else create the user based on ip address
  #
  # Returns user object
  def update
    params[:tiles].split(",").each do |tile|
      position = tile.split("-")[1].split("_")

      palette = @user.colorpalettes.find_by_row_and_column(position[0],position[1])
      if palette
        palette.update_attributes(code: params[:color_code], row: position[0],column: position[1])
      else
        @user.colorpalettes.create(code: params[:color_code], row: position[0],column: position[1])
      end
    end
    respond_to :js
  end

  def reload
    @palettes = Colorpalette.includes(:user).all
    respond_to :js
  end

  # Selects the user and palettes id counts
  #
  # Returns user object
  def dashboard
     @users = User.joins(:colorpalettes).select("users.*, count(colorpalettes.id) as count").group("users.id").order("count DESC")
  end

  private
    # Internal: Set the user if not present else create the user based on ip address
    #
    # Returns user object
    def set_username
      user = User.where(ipaddress: request.remote_ip).last
      if user.present?
        @user = user
      else
        username = "User #{User.count+1}-#{DateTime.now.to_i}"
        @user = User.create(username: username, ipaddress: request.remote_ip)
      end
    end
end
