class UsersController < ApplicationController
    before_action :logical_delete_user, only: [:show, :edit, :update, :unsubscribe]
    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
       unless @user.id == current_user.id
       redirect_to user_path(@current_user)
   end
    end

    def edit
        @user = User.find(params[:id])
       unless @user.id == current_user.id
       redirect_to user_path(@current_user)
      end
    end
  def remove
    @user = User.find(current_user.id)
  end

        def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have update user successfully."
        redirect_to user_url(@user)
      else
        render :edit
      end
    end

    def unsubscribe
      user = current_user
      user.is_delete = 1
      user.save
      redirect_to logout_path
    end

  private
  def user_params
      params.require(:user).permit(:user_name, :email, :profile_image ,:encrypted_password, :birth_date, :introduction)
  end
end
