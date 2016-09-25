class AddPasswordDigestToChatroom < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :password_digest, :string
  end
end
