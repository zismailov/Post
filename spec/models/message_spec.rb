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

require 'rails_helper'

RSpec.describe Message, type: :model do
  it do
    should belong_to(:sender)
      .with_foreign_key(:sender_id)
      .class_name('User')
  end
  it { should have_many(:recipients) }
end
