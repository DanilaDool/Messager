class AddFriendIdToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_reference :friendships, :friend, null: false, foreign_key: true
  end
end
