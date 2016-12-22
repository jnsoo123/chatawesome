class AddChatIdAndChatTypeToMessages < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :messages, column: :chatroom_id
    remove_column :messages, :chatroom_id, :integer
    add_column :messages, :chat_type, :string
    add_column :messages, :chat_id, :integer
  end
end
