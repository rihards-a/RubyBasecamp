class PasswordsResetsController < ApplicationController
  def new # renders the form
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      # Sends to PasswordMailer: user_params via with(); reset func email via .reset; send email as a background job via deliver_later because that takes time
      PasswordMailer.with(user: @user).reset.deliver_later # can be deliver_now but then the rails app will be less responsive because it waits to send
    end
    # Always sends this message so as to not disclose user information - whether or not a certain email is in use in the apps database
    redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
  end

  def edit
    # will look up the user and automatically confirm that the signed token hasn't expired, find_signed with an ! will throw an error for invalid tokens
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to password_reset_path, alert: "Your token has expired or is invalid. Please try again."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Your password has been reset successfully. Please sign in."
    else
      render :edit
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
