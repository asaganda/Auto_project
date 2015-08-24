class CarsController < ApplicationController

  def create

    @car = Car.new(car_params)
    @car.save 
    redirect_to car_build_path(car_id: @car.id, id: :details)

    # @car = Car.new(car_params)
    # @car.save
    # redirect_to wizard_path
  end

end