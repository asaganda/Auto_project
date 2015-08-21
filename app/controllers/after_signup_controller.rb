class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :car_build, :dealer_contact

  def show
    @user = current_user
    @car_build = Car.new
    render_wizard
  end

  def update
    @user = current_user
    render_wizard
  end

  private
  def car_params
    params.permit
    
  end

end
