# == Schema Information
#
# Table name: user_messages
#
#  id         :integer          not null, primary key
#  message_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_messages_on_message_id  (message_id)
#  index_user_messages_on_user_id     (user_id)
#

FactoryGirl.define do
  factory :user_message do
    message
    user
  end
end
