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
      flash[:notice] = 'Message sent!'
      redirect_to message
    else
      redirect_to messages_path, notice: 'Something went wrong'
    end
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :draft, recipient_ids: [])
  end
end
