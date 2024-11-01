class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by(email: params[:email])
      if user.present? && user.authenticate(params[:password]) # authenticate comes from has_secure_password rails feature in User model
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in succesfully"
      else
        flash[:alert] = "Invalid email or password" # not specifying which one is incorrect, so people can't check which email adresses have been registered
        render :new # this will render sessions/new.html.erb
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out"
    end
end
