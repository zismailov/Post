class Messages::InboxController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.received_messages
                      .includes(:sender)
                      .includes(:user_messages)
                      .paginate(page: params[:page])
                      .order(created_at: :desc)
    @message = current_user.sent_messages.build

    render 'messages/index'
  end
end
