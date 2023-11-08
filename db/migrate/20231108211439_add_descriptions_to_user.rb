class AddDescriptionsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :descriptions, :string
  end
end
