class CarsController < ApplicationController

  def index
    @cars = Cars.all
  end  

  def new
    @car = Car.new
  end
end