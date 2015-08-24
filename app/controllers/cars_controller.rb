class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.create(car_params)

    #this will break unless car has user_id
    @car.user = current_user
    @car.save

    if params[:onboarding].present?
      redirect_to after_signup_path(:dealer_contact)
    else
      #change to summary page or something
      redirect_to root_path
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :color)
  end
end
