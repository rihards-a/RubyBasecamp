class PasswordsController < ApplicationController
  before_action :require_user_logged_in # will redirect to the sign_in page and not render what is left in this file because requireuserloggedin redirects

  def edit
  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password Updated"
    else
      render :edit
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
