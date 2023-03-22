class AddStatusToAssists < ActiveRecord::Migration[7.0]
  def change
    add_column :assists, :completed, :boolean, null: false, default: false
  end
end
