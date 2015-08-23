class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :car_build, :dealer_contact

  def special
  end

  def show
    @car = Car.all
    render_wizard
  end

  def update
    @car = Car.find(car_params)
    @car.update_attributes(params[:car])
    render_wizard @car
  end

  # private
  # def car_params
  #   params.permit
    
  # end

end
