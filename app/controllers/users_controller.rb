class UsersController < ApplicationController
  def show
    @score = current_user.score_today
    @answered = current_user.answered_today
    @total_a = current_user.answered
    @total_correct = current_user.score
    @badges = []

    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503551/__lhzpoi.jpg", header: "Brainiac Boss", title: "10/10 for the day! Well done!" } if @score >= 10
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503484/Winning_Trophy_Clipart_Hd_PNG_Brain_Winning_A_Trophy_Illustration_Vector_On_White_Background_Brain_Clipart_Vector_Smart_PNG_Image_For_Free_Download_xsyqda.jpg",header: "Trivia Titan", title: "Wow! 100 questions done!!!" } if @total_a >= 100
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503447/You_re_Such_a_Smartie_rmhb8b.jpg",header: "Smarty Pants", title: "First 10 answered correctly!" }  if @total_correct >= 10
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503502/The_Duck02_kfkc94.png",header: "Academic Weapon",title: "0/10 correct but keep trying!" }  if @score.zero?
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503532/Pin_On_Smilies_Emoji_zqy8wb.jpg",header: "One-hit Wonder",title: "1 correct but keep going!!!" } if @total_correct >= 1
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503492/Trophy_for_the_winners_vector_clip_art_zhj3bm.jpg",header: "Trivia T-rex", title: "First 20 answered!!! " } if @total_a >= 20
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503522/Premium_Vector___Trophy_and_gold_medal_vector_cartoon_illustration__winning_award_champion_gold_trophy_u9pxce.jpg",header: "Game Guru", title: "First 10 answered, good start!" } if @total_a >= 10

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
