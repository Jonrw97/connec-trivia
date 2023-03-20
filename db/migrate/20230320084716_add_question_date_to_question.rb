class AddQuestionDateToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :question_date, :date
  end
end
