# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_first_name            (first_name)
#  index_users_on_last_name             (last_name)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    password { SecureRandom.hex(8) }
  end
end
