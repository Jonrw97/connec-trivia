if @user_choice.persisted?
  json.inserted_item render(partial: "questions/answer",
                            formats: :html,
                            locals: { user_choice: @user_choice,
                                      choices: @choices })
else
  json.form render("questions/show", status: :unprocessable_entity)
end
