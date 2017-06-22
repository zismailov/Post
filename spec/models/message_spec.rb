require 'rails_helper'

RSpec.describe Message, type: :model do
  it do
    should belong_to(:sender)
      .with_foreign_key(:sender_id)
      .class_name('User')
  end
  it do
    should belong_to(:receiver)
      .with_foreign_key(:receiver_id)
      .class_name('User')
  end
end
