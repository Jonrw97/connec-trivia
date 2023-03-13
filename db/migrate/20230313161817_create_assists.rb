class CreateAssists < ActiveRecord::Migration[7.0]
  def change
    create_table :assists do |t|
      t.references :question, null: false, foreign_key: true
      t.references :asker, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
