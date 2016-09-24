class AddIsPrivateToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :is_private, :boolean, default: false
  end
end
