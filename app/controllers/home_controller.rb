class HomeController < ApplicationController
  def index
  end

  def summary_page
    @car = current_user.cars
  end
end
