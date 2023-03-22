class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    friends = current_user.all_friends_confirmed
    friends.push(current_user)
    @users = friends.sort_by(&:score_today).reverse
    @answered = current_user.answered_today
    @score = current_user.score_today
    @lifeline_count = current_user.lifeline_count
  end
end
