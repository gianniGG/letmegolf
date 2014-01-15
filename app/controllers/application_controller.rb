class ApplicationController < ActionController::Base
  before_action :signed_in_user
  before_action :correct_user



  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def signed_in_user
      unless signed_in?
        flash[:warning] = "Please sign in"
        redirect_to signin_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user? @user
        flash[:warning] = "Please sign in"
        redirect_to signin_path
      end
    end
end
