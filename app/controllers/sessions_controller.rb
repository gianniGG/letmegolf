class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome to LetMeGolf"
    redirect_to user
    else
      flash.now[:warning] = "Incorrect credentials."
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
