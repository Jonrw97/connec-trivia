class Question < ApplicationRecord
  enum :difficulty, [ :easy, :medium, :hard ]
end
