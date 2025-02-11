module Admin
  class AdminController < ApplicationController
    before_action :require_admin
    before_action :set_user, only: [ :toggle_admin ]

    def dashboard
      @users = User.all # Show all users to manage their roles
    end

    def toggle_admin
      if @user == Current.user
        flash[:alert] = "You cannot change your own admin status."
      else
        if @user.update(is_admin: !@user.is_admin)
          flash[:notice] = "Admin status updated for #{@user.email}"
        else
          flash[:alert] = "Failed to update admin status"
        end
      end
      redirect_to admin_dashboard_path
    end

    private

    def require_admin
      unless Current.user.is_admin
        flash[:alert] = "Access denied: Admins only."
        redirect_to root_path
      end
    end

    def set_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "User not found."
      redirect_to admin_dashboard_path
    end
  end
end
