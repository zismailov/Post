class Messages::InboxController < ApplicationController
  include CommonMessagesController

  private

  def set_messages
    messages = current_user.received_messages
                      .includes(:sender)
                      .includes(:user_messages)
                      .paginate(page: params[:page])
                      .order(created_at: :desc)
    if params[:sender]
      messages = messages.where(sender_id: params[:sender])
    end

    @messages = messages
  end
end
