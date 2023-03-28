class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    friends = current_user.all_confirmed_friends
    friends.push(current_user)
    @users = friends.sort_by(&:score_today).reverse
    @answered = current_user.answered_today
    @score = User.includes(choices: :question).find(current_user.id).score_today
    @lifeline_count = current_user.lifeline_count
    # for navbar notify
    @notify_friendships = Friendship.where(status: :pending, receiver: current_user)[0]
    @notify_receiver = current_user.assists_as_receiver.select { |r| r.message.nil? }[0]
    @notify_asker = current_user.assists_as_asker.reject do |a|
                      a.message.nil? || !current_user.choices.where(question_id: a.question.id).first.nil?
                    end[0]
  end
end
