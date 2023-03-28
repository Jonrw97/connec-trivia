class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    friends = current_user.all_friends_confirmed
    friends.push(current_user)
    @users = friends.sort_by(&:score_today).reverse
    @answered = current_user.answered_today
    @score = User.includes(choices: :question).find(current_user.id).score_today
    @lifeline_count = current_user.lifeline_count
    # for navbar notify
    @notify_friendships = Friendship.where(status: "pending", receiver_id: current_user.id)[0]
    @notify_receiver = current_user.assists_as_receiver.select { |r| r.message.nil? }[0]
    @notify_asker = current_user.assists_as_asker.reject { |a| a.message.nil? || !current_user.choices.where(question_id: a.question.id).first.nil? }[0]
  end
end
