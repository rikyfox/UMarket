class Market < ApplicationRecord
  belongs_to :user, -> {where role: 'vendor'}
  validates :user_id, presence: true

  validates :name,  presence: true, length: { maximum: 50 }
  enum tipo: [:tecnologia, :sport, :elettrodomestici, :auto, :casa]
  validates :nation,  presence: true, length: { maximum: 50 }
  validates :city,  presence: true, length: { maximum: 50 }
end
