if @user_choice.persisted?
  json.inserted_item render(partial: "questions/answer",
                            formats: :html,
                            locals: { user_choice: @user_choice,
                                      choices: @choices })
else
  json.inserted_item render(partial: "questions/problem",
                            formats: :html,
                            locals: { user_choice: @user_choice,
                                      choices: @choices })
end
