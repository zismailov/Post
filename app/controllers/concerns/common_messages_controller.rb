module CommonMessagesController
  extend ActiveSupport::Concern

  def self.included(base)
    base.before_action :authenticate_user!
    base.before_action :set_messages, only: :index
    base.before_action :filter_messages, only: :index
  end

  def index
    @message = current_user.sent_messages.build

    respond_to do |format|
      format.html { render 'messages/index' }
      format.js { render 'messages/index' }
    end
  end

  private

  def set_messages
    # Must be overriden in the receiver controller
  end

  def filter_messages
    if params[:sender].present?
      @messages = @messages.where(sender_id: params[:sender])
    end

    if params[:query].present?
      @messages = @messages.search_full_text(params[:query])
    end
  end
end
