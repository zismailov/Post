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

class Message < ApplicationRecord
  include PgSearch
  pg_search_scope :search_full_test,
    against: [:title, :content],
    using: [:tsearch, :trigram, :dmetaphone]
 
  attr_accessor :recipient_ids

  belongs_to :sender, class_name: 'User', foreign_key: :sender_id
  has_many :user_messages, dependent: :destroy

  scope :drafts, -> { where(draft: true) }

  self.per_page = 10
end
