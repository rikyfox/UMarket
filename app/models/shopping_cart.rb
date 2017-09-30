class ShoppingCart < ApplicationRecord
  belongs_to :user, -> {where role: 'buyer'}
  acts_as_shopping_cart
end
