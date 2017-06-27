class MessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @message = Message.find(params[:id])
    authorize @message

    user_message = @message.user_messages.find_by(user: current_user)
    user_message.read! if user_message&.fresh?
  end

  def create
    message = MessageBuilderService.new(current_user.id, message_params).call

    if message.save
      UserMessageCreatorService.new(message.id, message_params).call
      ActionCable.server.broadcast(
        "messages_channel",
        message: render_message(message),
        recipients: message_params[:recipient_ids].reject(&:blank?)
      )
    else
      redirect_to messages_inbox_path, notice: 'Something went wrong'
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :draft, recipient_ids: [])
  end

  def render_message(message)
    render partial: 'message', locals: { message: message }
  end
end
