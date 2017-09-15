class RemovePrezzo1FromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :prezzo_cents, :integer
  end
end
