class Cars::BuildController < ApplicationController
  include Wicked::Wizard

  steps :car_build, :dealer_contact

  def show
    @car = Car.find(params[:car_id])
    render_wizard
  end

  def update
    @car = Car.find(params[:car_id])
    @car.update_attributes(car_params)
    render_wizard @car
  end

  def create
    @car = Car.create
    redirect_to wizard_path(steps.first, :car_id => @car.id)
  end

  # def new
  #   @car = Car.new
  # end
  
end