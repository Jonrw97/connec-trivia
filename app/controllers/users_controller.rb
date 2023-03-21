class UsersController < ApplicationController
  before_action :set_user
  def show
    @score = current_user.score_today
    @answered = current_user.answered_today
    @total_a = current_user.answered
    @total_correct = current_user.score
    @badges = []
    @badges << { icon: "🎖",title: "10/10" } if @score >= 10
    @badges << { icon: "👾",title: "100 total correct you sexy " }  if @total_correct == 100
    @badges << { icon: "🙀",title: "first 3 correct" }  if @total_correct >= 3
    @badges << { icon: "☢︎",title: "0/10 you sir are a academic weapon" }   if @score == 0
    @badges << { icon: "💅🏽",title: "1/10 amazing congrats " }  if @total_correct >= 1
    @badges << { icon: "♖",title: "first 20 questions answered woopwoop!!!!" } if @total_a >= 20
    @badges << { icon: "🎉",title: "10/10 perfect score obvously your Rick" } if @total_a >= 10
  end

  def index
    if params[:query].present?
      @users = User.where("username ILIKE ?", "%#{params[:query]}%")
    else
      @users = []
    end
    @friendship = Friendship.new
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
