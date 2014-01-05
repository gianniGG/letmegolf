class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    User.new
  end

  def create
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
    if @user.update_attributes(user_params)
      flash[:success]="Saved changes."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
