class QuestionsController < ApplicationController
  def show
    # view variables
    navbar_notify
    @question = Question.find(params[:id])
    @answered_today = User.includes(choices: :question).find(current_user.id).answered_today + 1
    @choices = @question.choices
    @ask_the_players = UserChoice.includes(choice: :question).select do |user_choice|
      user_choice.choice.question == @question
    end.group_by(&:choice)
    @assist = @question.assists.where(asker_id: current_user.id)

    # 50-50 and ask the players just use a query to show
    if params[:query] == "50-50"
      fifty_fifty
    elsif params[:query] == "ask-the-players"
      ask_the_players(@ask_the_players)
    end
    @user_choice = UserChoice.new
  end

  def fifty_fifty
    # remove 2 inccorect answers from choices
    if current_user.lifeline_count < 1
      redirect_to question_path(current_user.next_question)
    else
      current_user.update(lifeline_count: current_user.lifeline_count - 1)
      correct_answer = @question.choices.select(&:correct)
      incorrect_answers = @question.choices.reject(&:correct)
      @answers = [correct_answer[0], incorrect_answers.sample]
    end
  end

  def ask_the_players(grouped_choices)
    # group the choices by the amount of people who have answered with that choice
    if current_user.lifeline_count < 1
      redirect_to question_path(current_user.next_question)
    else
      current_user.update(lifeline_count: current_user.lifeline_count - 1)
      @ask_the_players = {}
      @choices.each { |c| @ask_the_players[c.content] = grouped_choices[c].nil? ? 0 : grouped_choices[c].count }
    end
  end
end
