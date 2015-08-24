class CarsController < ApplicationController

  def create

    @car = Car.new
    @car.save
    redirect_to car_build_path(car_id: @car.id, id: @car.id)

    # @car = Car.new(car_params)
    # @car.save
    # redirect_to wizard_path
  end

  private

  def car_params

    params.require(:car).permit(:make, :model, :year, :color)
  end

end