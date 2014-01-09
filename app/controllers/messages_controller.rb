class MessagesController < ApplicationController

  def new
    @user = current_user
    @message = Message.new
  end

  def create
    @user = current_user
    @message = Message.new message_params
    if @message.save
      flash[:success] = "Message sent."
      redirect_to user_messages_path(current_user)
    else
      render 'new'
      # @message.errors.clear
    end
  end

  def destroy
    # @message = nil
    # redirect_to user_messages_path(current_user)
  end

  def index
    @user = current_user
    @message = Message.all
  end


  def edit
    # @message = Message.new
  end

  def update
    # @message.update_attributes(params[:message][:content]) if params[:message][:user] == current_user
  end

  def show
    # @message.find_by(params[:message][:id])
  end

  def recipient
    User.find_by_name(params[:message][:recipient])
  end

    private

    def message_params
      { sender: current_user, recipient: recipient, body: params[:message][:body] }
    end

end
