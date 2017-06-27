class MessagesOrderingService
  def initialize(messages, params)
    @messages = messages
    @params = params
  end

  def call
    if @params[:sort_by].present? && @params[:order].present?
      if @params[:sort_by] == 'date' || @params[:sort_by] == 'author'
        sort_by = :created_at
      end

      if @params[:order] == 'asc' || @params[:order] == 'desc'
        order = @params[:order]
      end

      @messages = @messages.reorder(sort_by => order) if sort_by && order
    end
    @messages
  end
end
