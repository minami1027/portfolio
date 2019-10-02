class UsersRegistrationsController < ApplicationController
    protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name, :last_name, :kana_first, :kana_last, :postal_code,
      :address, :phone_number
    ])
  end
end
