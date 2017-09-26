class ShoppingList < ApplicationRecord
  belongs_to :shopping_cart
  acts_as_shopping_cart_using :shopping_list_item
end
