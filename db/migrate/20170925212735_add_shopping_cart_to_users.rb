class AddShoppingCartToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users , :shopping_cart , foreign_key: true
  end
end
