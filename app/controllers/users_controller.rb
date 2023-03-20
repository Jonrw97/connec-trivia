class UsersController < ApplicationController
  def show

    @score = current_user.score
    @answered = current_user.answered
    total_a = 120
    @total_a = total_a + @answered
    total_correct = 60
    @total_correct = total_correct + @score
    @badges =[]
    @badges << "🎖" if  @score >= 10
    @badges << "👾" if  @total_correct == 100
    @badges << "🙀" if @total_correct >= 3
    @badges << "☢︎"  if @score == 0
    @badges << "💅🏽" if total_correct >= 1
    @badges << "♖"  if @total_a >= 20
    @badges << "🎉" if @total_a >= 10

  end
end

  def index
    if params[:query].present?
      @users = User.where("username ILIKE ?", "%#{params[:query]}%")
    else
      @users = []

    end
    @friendship = Friendship.new
  end
