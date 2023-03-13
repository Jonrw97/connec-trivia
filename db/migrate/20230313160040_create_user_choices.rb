class CreateUserChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :user_choices do |t|

      t.timestamps
    end
  end
end
