class QuestionsController < ApplicationController
  def show
    @question = find_next_questions.pop
    @choices = @question.choices
    @user_choice = UserChoice.new
  end

  private

  def find_next_questions
    next_questions = []
    questions = Question.all
    questions.each do |question|
      question.user_choices.each do |choice|
        next_questions.push(question) unless choice.user == current_user
      end
    end
    return next_questions
  end
end
