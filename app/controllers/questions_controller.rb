class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question = current_user.unanswered_questions.sample unless current_user.unanswered_questions.include?(@question)

    if params[:query].nil?
      @choices = @question.choices
    else
      fifty_fifty
    end
    @user_choice = UserChoice.new
  end

  def fifty_fifty
    current_user.update(lifeline_count: current_user.lifeline_count - 1)
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
