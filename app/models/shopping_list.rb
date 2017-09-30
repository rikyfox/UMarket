class ShoppingList < ApplicationRecord
  belongs_to :user, -> {where role: 'buyer'}
  acts_as_shopping_cart_using :shopping_list_item

end
