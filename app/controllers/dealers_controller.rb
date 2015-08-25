class DealersController < ApplicationController
  
  # shows all the user's dealers that they have added to the database
  def summary_page
    # All the users' dealers
    @dealer = Dealer.all
  end

  # making a new dealer instance
  def new
    @dealer = Dealer.new
  end

  # creating a new dealer instance
  def create
    @dealer = Dealer.create(dealer_params)

    #this will break unless dealer has user_id
    # assigning the current_user's id to the dealer they're making
    @dealer.user_id = current_user.id
    # saving the dealer instance that has just been created
    @dealer.save

    # this corresponds to users that have just signed up
    # [:onboarding] tag is in the dealer_build.html.erb ONLY for new users
    # once user creates their first dealer, they're redirected to dealer_contact
    if params[:onboarding].present?
      redirect_to after_signup_path(:dealer_contact)
    else
      # WAITING FOR COMMENT
      redirect_to summary_page_path
    end
  end

  def edit
    @dealer = Dealer.find(params[:id])
  end

  def show
    @dealer = Dealer.new
  end

  def update
    @dealer = Dealer.find(params[:id])
    @dealer.update_attributes(dealer_params)
    redirect_to summary_page_path
  end

  def destroy
    @dealer = Dealer.find(params[:id])
    @dealer.destroy
    redirect_to summary_page_path
  end

  private

  def dealer_params
    params.require(:dealer).permit(:name, :town, :state, :salesperson, :telephone)
  end
end
