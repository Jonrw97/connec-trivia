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

  def unanswered_questions
    Question.where.not(id: choices.map(&:question_id))
  end
end
