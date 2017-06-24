# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  draft      :boolean
#  sender_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_messages_on_sender_id  (sender_id)
#

FactoryGirl.define do
  factory :message do
    title { FFaker::Lorem.word }
    content { FFaker::Lorem.paragraph }
    draft false
  end
end
