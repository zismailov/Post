class AddStateToUserMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :user_messages, :state, :integer, default: 0
    add_index :user_messages, :state
  end
end
