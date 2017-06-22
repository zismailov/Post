class CreateRecipients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipients do |t|
      t.integer :message_id
      t.integer :user_id

      t.timestamps
    end
    add_index :recipients, :message_id
    add_index :recipients, :user_id
  end
end
