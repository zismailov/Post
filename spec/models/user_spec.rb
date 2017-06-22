require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it do
    should have_many(:sent_messages)
      .with_foreign_key(:sender_id)
      .class_name('Message')
  end
  it do
    should have_many(:received_messages)
      .with_foreign_key(:receiver_id)
      .class_name('Message')
  end
end
