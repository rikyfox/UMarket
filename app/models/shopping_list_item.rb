class ShoppingListItem < ApplicationRecord
  acts_as_shopping_cart_item_for :shopping_list
end
