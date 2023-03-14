class QuestionsController < ApplicationController
  def show
    @questions = current_user.unanswered_questions.sample
    if @questions.nil?
      redirect_to root_path
    else
      @choices = @questions.choices
      @user_choice = UserChoice.new
    end
  end
end
