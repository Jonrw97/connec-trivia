class Question < ApplicationRecord
  enum difficulty: %i[easy medium hard]
  validates :prompt, presence: true
  has_many :assists, dependant: :destroy
  has_many :Choices, dependant: :destroy
end
