class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resources)
    special_path
  end

  # def after_sign_in_path_for(resources)
  #   after_sign_in_path
  # end
end