class AddShoppingListToShoppingCart < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_cart , :shopping_list , foreign_key: true
  end
end
