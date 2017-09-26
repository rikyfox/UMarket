class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_one :shopping_list
  acts_as_shopping_cart
end
