class ResultsController < ApplicationController
  def index
    @questions = Question.today
    @friends = current_user.all_friends_confirmed.select { |friend| friend.next_question.nil? }
  end
end
