class EditUserLifelinesInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :lifeline_count, :integer, default: 3
  end
end
