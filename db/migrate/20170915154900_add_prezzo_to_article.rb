class AddPrezzoToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :prezzo, :integer
  end
end
