class CreatePrivateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :private_chats do |t|
      t.references :user_one
      t.references :user_two
      t.timestamps
    end
  end
end
