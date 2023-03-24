class UsersController < ApplicationController
  def show
    @score = current_user.score_today
    @answered = current_user.answered_today
    @total_a = current_user.answered
    @total_correct = current_user.score
    @badges = []

    @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679645023/legend_nxzipa.png", header: "Brainiac Boss", title: "10/10 for the day! Well done!" } if @score >= 10
    @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679645023/genius_kzr8uj.png",header: "Trivia Titan", title: "Wow! 100 questions done!!!" } if @total_a >= 100
    @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679645023/smart_ugeofy.png",header: "Smarty Pants", title: "First 10 answered correctly!" }  if @total_correct >= 10
    @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679645023/fighter_ay0ly2.png",header: "Academic Weapon",title: "0/10 correct but keep trying!" }  if @score.zero?
    @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679645023/warrior_fjsz8j.png",header: "One-hit Wonder",title: "1 correct but keep going!!!" } if @total_correct >= 1
    @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679645023/mentalist_hzw14u.png",header: "Trivia T-rex", title: "First 20 answered!!! " } if @total_a >= 20
    @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679645023/fighter_ay0ly2.png",header: "Game Guru", title: "First 10 answered, good start!" } if @total_a >= 10

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

    @accepted_friendships = Friendship.where(status: "accept", receiver_id: current_user.id)
  end
end
