class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.boolean :draft
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
  end
end
