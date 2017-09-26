class Review < ApplicationRecord
  belongs_to :article
  belongs_to :user -> {where role: 'buyer'}
  default_scope -> { order(created_at: :desc) }
  validates :article_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
