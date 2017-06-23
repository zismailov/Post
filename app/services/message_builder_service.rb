class MessageBuilderService
  def initialize(sender_id, params)
    @sender_id = sender_id
    @title = params[:title]
    @content = params[:content]
    @recipient_ids = params[:recipient_ids]
    @draft = params[:draft]
  end

  def call
    Message.new(
      sender_id: @sender_id,
      title: @title,
      content: @content,
      draft: @draft
    )
  end
end
