class HomeController < ApplicationController
  def index
  end

  def summary_page
    @car = current_user.cars
    @dealer = current_user.dealers
  end
end
