class UsersController < ApplicationController
  def show
    @score = current_user.score_today
    @answered = current_user.answered_today
    @total_a = current_user.answered
    @total_correct = current_user.score
    @badges = []
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503551/__lhzpoi.jpg", title: "10/10 for the day WooHoo" } if @score >= 10
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503484/Winning_Trophy_Clipart_Hd_PNG_Brain_Winning_A_Trophy_Illustration_Vector_On_White_Background_Brain_Clipart_Vector_Smart_PNG_Image_For_Free_Download_xsyqda.jpg",  title: "100 total correct you sexy " } if @total_correct == 100
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503484/Winning_Trophy_Clipart_Hd_PNG_Brain_Winning_A_Trophy_Illustration_Vector_On_White_Background_Brain_Clipart_Vector_Smart_PNG_Image_For_Free_Download_xsyqda.jpg", title: "First 3 correct" }  if @total_correct >= 3
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503502/The_Duck02_kfkc94.png",title: "0/10 you sir are an academic weapon" }  if @score.zero?
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503532/Pin_On_Smilies_Emoji_zqy8wb.jpg",  title: "1 correct answer amazing congrats" } if @total_correct >= 1
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503551/__lhzpoi.jpg", title: "first 20 big boi" } if @total_a >= 20
    @badges << { url: "https://res.cloudinary.com/ddrxkfzlk/image/upload/v1679503522/Premium_Vector___Trophy_and_gold_medal_vector_cartoon_illustration__winning_award_champion_gold_trophy_u9pxce.jpg", title: "my man with the  big 1 0 wwooopwoop" } if @total_a >= 10

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
