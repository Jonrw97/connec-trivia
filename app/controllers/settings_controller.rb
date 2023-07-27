class SettingsController < ApplicationController
  def update
    @setting = Setting.find(params[:id])
    @setting.update(setting_params)

    respond_to do |format|
      if @setting.save
        format.html { redirect_to root_path }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:mute)
  end
end
