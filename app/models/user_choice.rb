class UserChoice < ApplicationRecord
  belongs_to :user
  belongs_to :choice
  validates :choice_id, uniqueness: { scope: :user_id }
end
