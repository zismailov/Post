require 'rails_helper'

RSpec.describe Recipient, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:message) }
end
