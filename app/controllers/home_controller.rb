class HomeController < ApplicationController
  def index
    @users = User.order_by(followers: "desc").page(params[:page]).per(30)
  end
end
