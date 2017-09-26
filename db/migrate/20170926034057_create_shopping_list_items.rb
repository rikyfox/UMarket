class CreateShoppingListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_list_items do |t|
      t.shopping_cart_item_fields# Creates the cart items fields
      t.timestamps
    end
  end
end
