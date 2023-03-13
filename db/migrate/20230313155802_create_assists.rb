class CreateAssists < ActiveRecord::Migration[7.0]
  def change
    create_table :assists do |t|

      t.timestamps
    end
  end
end
