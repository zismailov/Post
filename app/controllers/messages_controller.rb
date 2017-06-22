class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.received_messages
  end

  def show
    @message = Message.find(params[:id])
  end
end
