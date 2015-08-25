class CarsController < ApplicationController
  
  def summary_page
    @car = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.create(car_params)

    #this will break unless car has user_id
    # binding.pry
    @car.user_id = current_user.id
    @car.save

    if params[:onboarding].present?
      redirect_to after_signup_path(:dealer_contact)
    else
      #change to summary page or something
      redirect_to summary_page_path
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def show
    @car = Car.new
  end

  def update
    @car = Car.find(params[:id])
    @car.update_attributes(car_params)
    redirect_to summary_page_path
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to summary_page_path
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :year, :color)
  end
end
