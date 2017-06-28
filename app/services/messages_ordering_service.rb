# frozen_string_literal: true

class MessagesOrderingService
  def initialize(messages, params)
    @messages = messages
    @params = params
  end

  def call
    if @params[:sort_by].present? && @params[:order].present?

      sort_by = :created_at if @params[:sort_by] == 'date'
      sort_by = 'status' if @params[:sort_by] == 'status'

      if @params[:order] == 'asc' || @params[:order] == 'desc'
        order = @params[:order]
      end

      if order && sort_by && sort_by == 'status'
        @messages = @messages
                    .joins(:user_messages)
                    .reorder("user_messages.state #{order}")
      elsif order && sort_by && sort_by == :created_at
        @messages = @messages.reorder(sort_by => order)
      end
    end
    @messages
  end
end
