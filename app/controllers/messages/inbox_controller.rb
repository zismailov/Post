class Messages::InboxController < ApplicationController
  include CommonMessagesController

  private

  def set_messages
    @messages = current_user.received_messages
                      .includes(:sender)
                      .includes(:user_messages)
                      .paginate(page: params[:page])
                      .order(created_at: :desc)
  end
end
