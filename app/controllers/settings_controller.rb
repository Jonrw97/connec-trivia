class SettingsController < ApplicationController
  def update
    @setting = Setting.find(params[:id])
    @setting.update(setting_params)
    @setting.save
    redirect_to root_path
  end

  private

  def setting_params
    params.require(:setting).permit(:mute)
  end
end
