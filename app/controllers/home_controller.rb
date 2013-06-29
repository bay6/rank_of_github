class HomeController < ApplicationController
  def index
    @users = User.page(params[:page]).per(1000)
  end
end
