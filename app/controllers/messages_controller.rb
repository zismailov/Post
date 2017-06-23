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
    authorize @message
  end

  def create
    message = MessageBuilderService.new(current_user.id, message_params).call

    if message.save
      RecipientCreatorService.new(message.id, message_params).call
      redirect_to message, notice: 'Message sent!'
    else
      redirect_to messages_path, notice: 'Something went wrong'
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :draft, recipient_ids: [])
  end
end
