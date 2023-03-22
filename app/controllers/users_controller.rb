class UsersController < ApplicationController
  def show
    @score = current_user.score_today
    @answered = current_user.answered_today
    @total_a = current_user.answered
    @total_correct = current_user.score
    @badges = []
    @badges << { icon: "🎖", title: "10/10 for the day WooHoo" } if @score >= 10
    @badges << { icon: "👾", title: "100 total correct you sexy " } if @total_correct == 100
    @badges << { icon: "🙀", title: "First 3 correct" } if @total_correct >= 3
    @badges << { icon: "☢︎", title: "0/10 you sir are an academic weapon" } if @score.zero?
    @badges << { icon: "💅🏽", title: "1 correct answer amazing congrats" } if @total_correct >= 1
    @badges << { icon: "♖", title: "First 20 questions answered woopwoop!!!!" } if @total_a >= 20
    @badges << { icon: "🎉", title: "First 10 questions answered" } if @total_a >= 10
  end

  def index
    if params[:query].present?
      users = User.where("username ILIKE ?", "%#{params[:query]}%")
      friends = current_user.all_friends
      @users = []
      users.each do |user|
        @users.push(user) unless friends.include?(user)
      end
    else
      @users = []
    end
    @friendship = Friendship.new
    @pending_friendships = Friendship.where(status: "pending", receiver_id: current_user.id)
    p @pending_friendships.count

    @accepted_friendships = Friendship.where(status: "accept", receiver_id: current_user.id)
  end
end
