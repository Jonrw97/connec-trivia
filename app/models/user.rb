require 'pg_search'

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id, dependent: :destroy
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id, dependent: :destroy

  has_many :assists_as_asker, class_name: "Assist", foreign_key: :asker_id, dependent: :destroy
  has_many :assists_as_receiver, class_name: "Assist", foreign_key: :receiver_id, dependent: :destroy

  has_many :user_choices, dependent: :destroy

  has_many :choices, through: :user_choices

  has_many :users

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_username, against: [:username]
  # , using: { search: { prefix: true } }

  def unanswered_questions
    Question.where.not(id: choices.map(&:question_id)).where(question_date: Date.today)
  end

  def score
    choices.count(&:correct)
  end

  def answered
    choices.count
  end

  def score_today
    score_today = []
    choices.each do |choice|
      score_today.push(choice) if choice.question.question_date == Date.today
    end
    score_today.count(&:correct)
  end

  def answered_today_block
    answered_today = []
    choices.each do |choice|
      answered_today.push(choice) if choice.question.question_date == Date.today
    end
    answered_today
  end

  def answered_today
    answered_today_block.count
  end

  def all_friends
    users = []
    friendships_as_asker.each do |friendship|
      users << User.find(friendship.receiver_id)
    end

    friendships_as_receiver.each do |friendship|
      users << User.find(friendship.asker_id)
    end
    users
  end

  def all_friends_confirmed
    users = []
    friendships_as_asker.where(status: 1).each do |friendship|
      users << User.find(friendship.receiver_id)
    end

    friendships_as_receiver.where(status: 1).each do |friendship|
      users << User.find(friendship.asker_id)
    end
    users
  end

  def all_pending_friends
    users = []
    friendships_as_asker.each do |friendship|
      users << User.find(friendship.receiver_id)
    end

    friendships_as_receiver.each do |friendship|
      users << User.find(friendship.asker_id)
    end
    users
  end
end
