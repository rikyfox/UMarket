class RemovePrezzoFromArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :prezzo_currency, :string
  end
end
