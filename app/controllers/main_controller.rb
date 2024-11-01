class MainController < ApplicationController
  def index
    # the flash message persists for 1 request, but with flash.now it disappears after the first
    # flash[:notice] = "Logged in successfully"
    if session[:user_id]
      # session["user_id"] looks up an id that has been assigned - if it's not a new account
      # @user = User.find(session[:user_id]) # .find is used if it's guaranteed that the user exists
      @user = User.find_by(id: session[:user_id]) # find_by doesn't throw an error when not found, for example if user is logged in while their account is being deleted

      # TESTING PURPOSES DISPLAYS ALL USER EMAILS
      @users = User.all
    end
  end
end
