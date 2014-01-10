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
    end
  end

  def index
    @received_messages = current_user.received_messages
    @sent_messages = current_user.sent_messages
  end


  def recipient
    User.find_by_name(params[:message][:recipient])
  end

    private

    def message_params
      { sender: current_user, recipient: recipient, body: params[:message][:body] }
    end

end
