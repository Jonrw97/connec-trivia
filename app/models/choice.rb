class Choice < ApplicationRecord
  belongs_to :question
  has_many :user_choices, dependent: :destroy
end
