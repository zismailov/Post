class Messages::SentController < ApplicationController
  include CommonMessagesController

  private

  def set_messages
    @messages = current_user.sent_messages
                      .includes(:sender)
                      .paginate(page: params[:page])
                      .order(created_at: :desc)
  end
end
