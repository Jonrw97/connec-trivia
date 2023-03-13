class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.string :difficulty

      t.timestamps
    end
  end
end
