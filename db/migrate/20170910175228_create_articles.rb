class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.monetize :prezzo
      t.text :description
      t.boolean :status
      t.references :market, foreign_key: true

      t.timestamps
    end
  end
end
