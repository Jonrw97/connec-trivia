class AddChoiceToUserChoice < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_choices, :choice, null: false, foreign_key: true
  end
end
