class UserChoicesController < ApplicationController
  def create
    user_choice = UserChoice.new
    user_choice.user = current_user
    user_choice.choice = Choice.find_by(content: safe_params[:choice_id])
    user_choice.save
    redirect_to questions_path
  end

  private

  def safe_params
    params.require(:user_choice).permit(:choice_id)
  end
end
