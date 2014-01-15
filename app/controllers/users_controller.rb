class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:edit, :udpate, :show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the community."
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @password_correct = current_user.authenticate(params[:user][:old_password])

    if @password_correct && @user.update_attributes(user_params)
      flash[:success]="Saved changes."
      redirect_to @user
    else
      @user.errors.add(:password, 'wrong') unless @password_correct
      render 'edit'
    end
  end

  def statistics
  end

  def check_username
    username_is_free = User.find_by_name(params[:username]).nil?
    render json: { free: username_is_free }.to_json
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :old_password)
    end


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
