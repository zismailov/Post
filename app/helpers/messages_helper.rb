# frozen_string_literal: true

module MessagesHelper
  def page_title
    params[:controller].gsub('messages/', '').capitalize
  end

  def read_class(message)
    if message.user_messages.find_by(user: current_user)&.fresh?
      'list-group-item-info'
    end
  end
end
