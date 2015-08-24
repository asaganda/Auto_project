class Cars::BuildController < ApplicationController

  # skip_before_filter :setup_wizard, only: :show
  include Wicked::Wizard
  # skip_before_filter :setup_wizard, only: :show
  steps :car_build, :dealer_contact


  # def car_build
  #   @car = Car.find(params[:car_id])
  #   render_wizard

  # end 
  def show
    # binding.pry
    @car = Car.find(params[:car_id])
    render_wizard
  end

  def update
    binding.pry
    @car = Car.find(params[:car_id])
    @car.update_attributes(car_params)
    render_wizard @car
  end

  def create
    binding.pry
    @car = Car.create
    redirect_to wizard_path(steps.first, :car_id => @car.id)
  end

  # def new
  #   @car = Car.new
  # end
  
end