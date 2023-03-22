class AddMessageToAssists < ActiveRecord::Migration[7.0]
  def change
    add_column :assists, :message, :text
  end
end
