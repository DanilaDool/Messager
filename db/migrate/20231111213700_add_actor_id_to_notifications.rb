# db/migrate/20231111213304_add_actor_id_to_notifications.rb
class AddActorIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :actor, foreign_key: { to_table: :users }
  end
end
