class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
  end

  protected
  def after_sign_up_path_for(resources)
    special_path
  end
end