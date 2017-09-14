class Article < ApplicationRecord
  belongs_to :market
  validates :market_id, presence: true

  validates :name,  presence: true, length: { maximum: 50 }
  validates :prezzo, :numericality => { :greater_than => 0 } #maggiore di 0 euro , permer
  validates :description, presence: true, length: { maximum: 140 }
  validates :status, inclusion: [true, false]
  end
