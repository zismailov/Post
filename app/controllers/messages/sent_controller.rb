class Messages::SentController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.sent_messages
                      .includes(:sender)
                      .paginate(page: params[:page])
                      .order(created_at: :desc)
    @message = current_user.sent_messages.build
    
    respond_to do |format|
      format.html { render 'messages/index' }
      format.js { render 'messages/index' }
    end
  end
end
