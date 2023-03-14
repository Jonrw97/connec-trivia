class Question < ApplicationRecord
  enum difficulty: %i[easy medium hard]
  validates :content, presence: true
end
