class Question < ApplicationRecord
  enum :difficulty, [ :easy, :medium, :hard ]
  validates :content, presence: true
end
