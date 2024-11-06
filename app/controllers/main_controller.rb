class MainController < ApplicationController
  def index
    # TESTING PURPOSES DISPLAYS ALL USER EMAILS
    @users = User.all
  end
end
