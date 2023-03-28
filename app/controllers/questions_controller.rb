class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])

    @answered_today = User.includes(choices: :question).find(current_user.id).answered_today + 1
    @choices = @question.choices
    @ask_the_players = UserChoice.includes(choice: :question).select do |user_choice|
      user_choice.choice.question == @question
    end.group_by(&:choice)
    @assist = @question.assists.where(asker_id: current_user.id)

    case params[:query]
    when "50-50"
      fifty_fifty
    when "ask-the-players"
      ask_the_players(@ask_the_players)
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

  def ask_the_players(grouped_choices)
    current_user.update(lifeline_count: current_user.lifeline_count - 1)

    @ask_the_players = {}
    @choices.each { |c| @ask_the_players[c.content] = grouped_choices[c].nil? ? 0 : grouped_choices[c].count }
  end
end
