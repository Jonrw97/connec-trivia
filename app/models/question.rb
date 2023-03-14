class Question < ApplicationRecord
  enum difficulty: %i[easy medium hard]
  validates :prompt, presence: true
end
