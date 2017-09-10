class Followmarket < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :market_followed, class_name: "Market"
  validates :buyer_id, presence: true
  validates :market_followed_id, presence: true
end
