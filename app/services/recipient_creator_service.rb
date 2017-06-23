class RecipientCreatorService
  def initialize(message_id, params)
    @recipient_ids = params[:recipient_ids]
    @message_id = message_id
  end

  def call
    @recipient_ids.each do |id|
      Recipient.create(user_id: id, message_id: @message_id)
    end
  end
end
