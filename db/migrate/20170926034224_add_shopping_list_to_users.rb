class AddShoppingListToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users , :shopping_list , foreign_key: true
  end
end
