module MessagesHelper
  def recipients_for_select
    options_from_collection_for_select(User.all, :id, :first_name)
  end

  def page_title
    params[:controller].gsub('messages/', '').capitalize
  end

  def read_class(message)
    if message.user_messages.find_by(user: current_user).fresh?
      'list-group-item-info'
    end
  end
end
