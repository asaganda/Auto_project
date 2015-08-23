class CarsController < ApplicationController
  def create
    @car = Car.create
    redirect_to wizard_path(steps.first, :car_id => @car.id)
  end
end