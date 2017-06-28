# frozen_string_literal: true

class Messages::DraftsController < ApplicationController
  include CommonMessagesController

  private

  def set_messages
    @messages = current_user.sent_messages
                            .drafts
                            .includes(:sender)
                            .paginate(page: params[:page])
                            .order(created_at: :desc)
  end
end
