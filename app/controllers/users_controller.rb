class UsersController < ApplicationController
  def show
    @score = current_user.score_today
    @answered = current_user.answered_today
    @total_a = current_user.answered
    @total_correct = current_user.score
    @badge = @score == 10 ? "🎖" : "No badges yet"
  end

  def index
    if params[:query].present?
      @users = User.where("username ILIKE ?", "%#{params[:query]}%")
    else
      @users = []

    end
    @friendship = Friendship.new
  end
end
