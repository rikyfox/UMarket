class Market < ApplicationRecord
  belongs_to :user, -> {where role: 'vendor'}
  validates :user_id, presence: true

  validates :name,  presence: true, length: { maximum: 50 }
  enum tipo: [:tecnologia, :sport, :elettrodomestici, :auto, :casa]
  validates :nation,  presence: true, length: { maximum: 50 }
  validates :city,  presence: true, length: { maximum: 50 }
  
  has_many :passive_followmarkets, class_name:  "Followmarket",
                                   foreign_key: "market_followed_id",
                                   dependent:   :destroy

  has_many :followerbuyers, -> {where role: 'buyer'}, through: :passive_followmarkets, source: :buyer  #the source parameter, which explicitly tells Rails that the source of the following array is the set of followed ids.								  
							
 has_many :articles, dependent: :destroy
end
