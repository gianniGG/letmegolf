class MessagesController < ApplicationController

  def new
  end

  def create
    @user = current_user
    @message = Message.new message_params
    @received_messages = current_user.received_messages
    @sent_messages = current_user.sent_messages

    if @message.save
      flash[:success] = "Message sent."
      redirect_to user_messages_path(current_user)
    else

      render :index
    end
  end

  def index
    @received_messages = current_user.received_messages
    @sent_messages = current_user.sent_messages

    @user = current_user
    @message = Message.new
  end

  def show
    # @received_message = current_user.messages.
  end

  def recipient
    User.find_by_name(params[:message][:recipient])
  end

    private

    def message_params
      { sender: current_user, recipient: recipient,
        subject: params[:message][:subject] != '' ? params[:message][:subject] : "No subject",
        body: params[:message][:body] }
    end

end
