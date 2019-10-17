class Users::SessionsController < Devise::SessionsController
    # before_action :logical_delete_user
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    def new
       super
    end
end
