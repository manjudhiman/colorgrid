class HomeController < ApplicationController
  before_action :set_username

  def index

  end

  def update
    params[:tiles].split(",").each do |tile|
      position = tile.split("-")[1].split("_")
      @user.colorpalettes.create(code: params[:color_code], row: position[0],column: position[1])
    end
    respond_to :js
  end

  def reload
    respond_to :js
  end

  def dashboard
     @users = User.joins(:colorpalettes).select("users.*, count(colorpalettes.id) as count").group("users.id").order("count DESC")
    @users
  end

  protected
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
