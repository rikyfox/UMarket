class CreateShoppingCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_cart_items do |t|
      t.shopping_cart_item_fields# Creates the cart items fields
      t.integer  :prezzo
      t.string   :nome
      t.boolean  :aviable
      t.timestamps
    end
  end
end
