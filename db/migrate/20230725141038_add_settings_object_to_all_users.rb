class AddSettingsObjectToAllUsers < ActiveRecord::Migration[7.0]
  def change
    User.all.each do |user|
      setting = Setting.new
      setting.user = user
      setting.save
    end
  end
end
