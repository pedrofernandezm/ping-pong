class HomeController < ApplicationController

  def index
    @users = User.order(rating: :desc)
  end

end
