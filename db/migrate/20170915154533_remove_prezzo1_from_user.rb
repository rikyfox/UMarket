class RemovePrezzo1FromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :prezzo_cents, :integer
  end
end
