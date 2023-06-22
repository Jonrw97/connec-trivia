class UsersController < ApplicationController
  def show
    @score = current_user.score_today
    @answered = current_user.answered_today
    @total_a = current_user.answered
    @total_correct = current_user.score
    @badges = []

    if @score >= 10
      @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679659608/Legend_1_pyknt2.png",
                   header: "Brainiac Boss", title: "10/10 for the day! Well done!" }
    end
    if @total_a >= 100
      @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679656558/Genius_1_qlceix.png",
                   header: "Trivia Titan", title: "Wow! 100 questions done!!!" }
    end
    if @total_correct >= 10
      @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679656559/Smart_1_xochug.png",
                   header: "Smarty Pants", title: "First 10 answered correctly!" }
    end
    if @score.zero?
      @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679656558/Fighter_1_nxaywn.png",
                   header: "Academic Weapon", title: "0/10 correct but keep trying!" }
    end
    if @total_correct >= 1
      @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679656558/Warrior_1_etfouc.png",
                   header: "One-hit Wonder", title: "1 correct but keep going!!!" }
    end
    if @total_a >= 20
      @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679656558/Mentalist_1_ytsdlw.png",
                   header: "Trivia T-rex", title: "First 20 answered, Awesome!!! " }
    end
    if @total_a >= 10
      @badges << { url: "https://res.cloudinary.com/dvvbk1j65/image/upload/v1679656559/Spartan_1_pj4f1k.png",
                   header: "Game Guru", title: "First 10 answered, good start!" }
    end
    navbar_notify
  end

  def index
    if params[:query].present?
      users = User.search_by_username(params[:query])
      friends = current_user.all_friends
      @users = []
      users.each { |user| @users.push(user) unless friends.include?(user) || user == current_user }
    else
      @users = []
    end
    @friendship = Friendship.new
    @pending_friendships = Friendship.where(status: "pending", receiver_id: current_user.id)
    @accepted_friendships = Friendship.where(status: "accept", receiver_id: current_user.id)
    navbar_notify
  end
end
