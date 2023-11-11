class AddForeignKeyToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_column :friendships, :friend_id, :integer
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
