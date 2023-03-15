class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    if params[:query].nil?
      @choices = @question.choices.shuffle
    else
      fifty_fifty
    end
    @user_choice = UserChoice.new
  end

  def fifty_fifty
    incorrect_answers = []
    @question.choices.each do |choice|
      if choice.correct
        @correct_answer = choice
      else
        incorrect_answers.push(choice)
      end
    end
    @answers = [@correct_answer, incorrect_answers.sample]
  end
end
