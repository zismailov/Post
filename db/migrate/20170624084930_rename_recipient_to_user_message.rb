class RenameRecipientToUserMessage < ActiveRecord::Migration[5.1]
  def change
    rename_table :recipients, :user_messages
  end
end
