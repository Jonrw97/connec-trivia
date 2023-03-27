class Question < ApplicationRecord
  validates :prompt, presence: true
  has_many :choices, dependent: :destroy
  has_many :assists, dependent: :destroy
  has_many :user_choices, through: :choices, dependent: :destroy
  scope :today, -> { where(question_date: Date.today) }
end
