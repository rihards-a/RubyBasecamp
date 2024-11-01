class UserController < ApplicationController
    def show
      # will have to make this to display user information later
    end

    def new
        # instance variable with @, so the variable is available outside of this method
        @user = User.new
    end

    def create
        # not using params[:user] because if we want to include future flags like is_admin, we do not want to allow the user to control that, we use a helper function
        @user = User.new(user_params)
        if @user.save # input data validation
            # signing in via session (not sign, for encryption purposes) cookies, can be set only server side - browsers can't tamper with session cookies
            session[:user_id] = @user.id
            # WILL HAVE TO CHANGE TO USER_PATH TO #SHOW CONTROLLER WHEN IT IS SET UP
            redirect_to root_path, notice: "successfully created account"
        else
            render :new # goes back to the sign up page, error messages are handled by forms
        end
    end

    private
    def user_params
        # .require(user) ensures that params include the user key, if it isn't present it raises an error, permit declares what can be passed in
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end


=begin
INSIGHTS
1.
    # params references the post request parameters from the form from #new / alternatively it can receive URL input
    render plain: params[:user]
    # :user because we were working with @user and we only want to display its contents not this whole string that includes token and commit hashes:
    # {"authenticity_token"=>"JPEasYJrii0SsH8iYvXN-Igg-uUxIZFWoR-9SHy3K8NxAdjW3pA-gP2mDZUsBRuurbxDkRwqU7-7majGH-GQFQ", "user"=>{"email"=>"123as@asd", "password"=>"", "password_confirmation"=>""}, "commit"=>"Create User", "controller"=>"user", "action"=>"create"}

=end
