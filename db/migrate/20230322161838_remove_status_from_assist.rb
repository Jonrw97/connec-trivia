class RemoveStatusFromAssist < ActiveRecord::Migration[7.0]
  def change
    remove_column :assists, :completed
  end
end
