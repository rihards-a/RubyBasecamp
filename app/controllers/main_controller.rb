class MainController < ApplicationController
  def index
    # the flash message persists for 1 request, but with flash.now it disappears after the first
    # flash[:notice] = "Logged in successfully"
  end
end
