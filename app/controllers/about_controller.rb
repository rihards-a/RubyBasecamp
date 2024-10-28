class AboutController < ApplicationController
  def index
    # doesn't need to have anything because inherits from AppCtr
    # if this doesn't do rendering then AppCtr will do the default rendering
    # that goes into the app views folder and will ask for about folder
  end
end
