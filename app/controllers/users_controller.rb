class UsersController < ApplicationController
  def show
    @score = current_user.score
    @answered = current_user.answered
    total_a = 40
    @total_a = total_a + @answered
    total_correct = 26
    @total_correct = total_correct + @score
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
