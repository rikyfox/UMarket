class Article < ApplicationRecord
  has_many  :reviews
  belongs_to :market
  validates :market_id, presence: true

  validates :name,  presence: true, length: { maximum: 50 }
  validates :prezzo, :numericality => { :greater_than => 0 } #maggiore di 0 euro , permer
  validates :description, presence: true, length: { maximum: 140 }
  validates :status, inclusion: [true, false]
  mount_uploader :picture, PictureUploader
  validate  :picture_size

    private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

  end
