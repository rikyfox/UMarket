class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.string :name
      t.integer :tipo
      t.string :nation
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
