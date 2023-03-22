class Friendship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :asker_id, uniqueness: { scope: :receiver_id }
  validates :receiver_id, uniqueness: { scope: :asker_id }
  enum :status, { pending: 0, accept: 1, decline: 2 }
end
