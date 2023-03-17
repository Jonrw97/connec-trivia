class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    friends = current_user.all_friends
    friends.push(current_user)
    @users = friends.sort_by(&:score).reverse
    @answered = current_user.answered
    @score = current_user.score
    @lifeline_count = current_user.lifeline_count
  end
end
