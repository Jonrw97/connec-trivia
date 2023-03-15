class UserChoicesController < ApplicationController
  def create
    user_choice = UserChoice.new
    user_choice.user = current_user
    user_choice.choice = Choice.find_by(content: safe_params[:choice_id])
    user_choice.save
    if current_user.unanswered_questions.sample.nil?
      redirect_to root_path
    else
      redirect_to question_path(current_user.unanswered_questions.sample)
    end
  end

  private

  def safe_params
    params.require(:user_choice).permit(:choice_id)
  end
end
