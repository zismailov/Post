# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  draft       :boolean
#  sender_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :message do
    title { FFaker::Lorem.word }
    content { FFaker::Lorem.paragraph }
    draft false
    association :sender, factory: :user
    association :receiver, factory: :user
  end
end
