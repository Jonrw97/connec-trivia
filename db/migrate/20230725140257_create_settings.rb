class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.boolean :mute, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
