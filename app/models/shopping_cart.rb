class ShoppingCart < ApplicationRecord
  belongs_to :user
  acts_as_shopping_cart
end
