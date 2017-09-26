class CreateShoppingListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_list_items do |t|
      t.shopping_list_item_fiels# Creates the cart items fields
      t.timestamps
    end
  end
end
