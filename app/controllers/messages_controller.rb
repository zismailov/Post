class MessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @message = Message.find(params[:id])
    authorize @message
  end

  def create
    message = MessageBuilderService.new(current_user.id, message_params).call

    if message.save
      RecipientCreatorService.new(message.id, message_params).call
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
