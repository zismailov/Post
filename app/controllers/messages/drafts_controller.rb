class Messages::DraftsController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.sent_messages
                      .drafts
                      .includes(:sender)
                      .paginate(page: params[:page])
                      .order(created_at: :desc)
    @message = current_user.sent_messages.build

    render 'messages/index'
  end
end
