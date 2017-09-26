class User < ApplicationRecord

  enum role: [:buyer, :vendor, :admin]
  has_one  :shopping_cart
  has_many :shopping_lists
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :markets, dependent: :destroy
  has_many :microposts, dependent: :destroy  #the option dependent: :destroy arranges for the dependent microposts to be destroyed when the user itself is destroyed
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed  #the source parameter, which explicitly tells Rails that the source of the following array is the set of followed ids.

  has_many :followers, through: :passive_relationships, source: :follower

  has_many :active_followmarkets, class_name:  "Followmarket",
                                  foreign_key: "buyer_id",
                                  dependent:   :destroy

  has_many :followingmarkets, through: :active_followmarkets, source: :market_followed  #the source parameter, which explicitly tells Rails that the source of the following array is the set of followed ids.


  attr_accessor :remember_token
  before_save { self.email = email.downcase }   #email = email.downcase wouldn’t work.
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  acts_as_messageable
  before_destroy { messages.destroy_all }

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Defines a proto-feed.
  # See "Following users" for the full implementation.
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)           #similar to Micropost.where("user_id IN (?) OR user_id = ?", following_ids, id)
  end

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # Follows a market.
  def followmarket(other_market)
    followingmarkets << other_market
  end

  # Unfollows a market.
  def unfollowmarket(other_market)
    followingmarkets.delete(other_market)
  end

  # Returns true if the current user is following the other user.
  def followingmarket?(other_market)
    followingmarkets.include?(other_market)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given role matches any of the user’s roles.
  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

end
