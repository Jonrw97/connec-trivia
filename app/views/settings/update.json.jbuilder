if @setting.persisted?
  json.form render(partial: "settings/form", formats: :html)
else
  json.form render(partial: "settings/form", formats: :html)
end
