class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  before_action :set_current_user # run before any actions - methods inside other controllers like main, sessions etc. beacuse theyre based on this AppCtrl class

  def set_current_user
    if session[:user_id]
      # session["user_id"] looks up an id that has been assigned - if it's not a new account
      # @user = User.find(session[:user_id]) # .find is used if it's guaranteed that the user exists
      Current.user = User.find_by(id: session[:user_id]) # find_by doesn't throw an error when not found, for example if user is logged in while their account is being deleted
    end
  end

  def require_user_logged_in
    redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil?
  end
end
