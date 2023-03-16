if @friendship.persisted?
  json.form render(partial: "users/result", formats: :html)
  json.inserted_item render(partial: "users/result", formats: :html)
else
  json.form render(partial: "users/result", formats: :html)
end
