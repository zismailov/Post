# frozen_string_literal: true

# == Schema Information
#
# Table name: user_messages
#
#  id         :integer          not null, primary key
#  message_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state      :integer          default("fresh")
#
# Indexes
#
#  index_user_messages_on_message_id  (message_id)
#  index_user_messages_on_state       (state)
#  index_user_messages_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe UserMessage, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:message) }
end
