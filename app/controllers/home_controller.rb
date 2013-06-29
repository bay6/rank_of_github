class HomeController < ApplicationController
  def index
    @user = User.page(params[:page]).per(1000)
  end
end
