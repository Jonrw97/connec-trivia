class QuestionsController < ApplicationController
  def show
    @questions = Question.find(params[:id])
    @choices = @questions.choices
    @user_choice = UserChoice.new
  end
end
