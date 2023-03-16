class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @users = []

    #@users = User.all_friends
    # this should be a class method for User that returns all the friends

    @answered = current_user.choices.count
    @score = current_user.choices.count { |choice| choice.correct }
    @lifeline_count = current_user.lifeline_count

    p 'People I asked to be my friends '
    p 'I am the asker'
    current_user.friendships_as_asker.each do |friendship|
      @users << User.find(friendship.receiver_id)
    end

    p 'People who asked me to be friends '
    p 'I am the receiver'
    current_user.friendships_as_receiver.each do |friendship|
      @users << User.find(friendship.asker_id)
    end
  end
end
