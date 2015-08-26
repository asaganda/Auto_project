class CarsController < ApplicationController
  
  # shows all the user's cars that they have added to the database
  def summary_page
    # All the users' cars
    @car = Car.all
  end

  # making a new car instance
  def new
    @car = Car.new
  end

  # creating a new car instance
  def create
    @car = Car.create(car_params)

    #this will break unless car has user_id
    # assigning the current_user's id to the car they're making
    @car.user_id = current_user.id
    # saving the car instance that has just been created
    @car.save

    # this corresponds to users that have just signed up
    # [:onboarding] tag is in the car_build.html.erb ONLY for new users
    # once user creates their first car, they're redirected to dealer_contact
    if params[:onboarding].present?
      redirect_to after_signup_path(:dealer_contact)
    else
      # if [:onboarding] hidden field tag isn't present
      # then the user gets redirected to summary page
      # (users signing in for the 2nd time + )
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
    params.require(:car).permit(:make, :model, :year, :color, :price)
  end
end
