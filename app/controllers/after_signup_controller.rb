class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :car_build, :dealer_contact

  def special
  end

  def show
    @car = Car.new
    @dealer = Dealer.new
    render_wizard
  end

end
