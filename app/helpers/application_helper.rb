module ApplicationHelper
  def alert_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def users_except_current
    options_from_collection_for_select(
      User.all.to_a - [current_user], 'id', 'first_name'
    )
  end
end
