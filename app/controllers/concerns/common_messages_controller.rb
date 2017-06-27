module CommonMessagesController
  extend ActiveSupport::Concern

  def self.included(base)
    base.before_action :authenticate_user!
    base.before_action :set_messages, only: :index
    base.before_action :filter_messages, only: :index
  end

  def index
    @message = current_user.sent_messages.build

    respond_to_filtering_and_pagination
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

  def respond_to_filtering_and_pagination
    respond_to do |format|
      format.html { render 'messages/index' }

      if params[:sender] || params[:query] || params[:commit]
        format.js { render 'messages/filter_results' }
      else
        format.js { render 'messages/index' }
      end
    end
  end
end
