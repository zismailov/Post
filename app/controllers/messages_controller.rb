class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.received_messages
                    .includes(:sender)
                    .order(created_at: :desc)
    @message = current_user.sent_messages.build
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    message = current_user.sent_messages.build(message_params)

    if message.save
      redirect_to message, notice: 'Message sent'
    else
      redirect_to messages_path, notice: 'Something went wrong'
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :draft, :receiver_id)
  end
end
