class AddStatusToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :status, :integer, default: 0
  end
end
