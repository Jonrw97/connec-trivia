if @friendship.persisted?
  json.form render(partial: "users/result", formats: :html, locals: { friendship: @friendship })
  json.inserted_item render(partial: "users/result", formats: :html)
else
  json.form render(partial: "users/result", formats: :html)
end
