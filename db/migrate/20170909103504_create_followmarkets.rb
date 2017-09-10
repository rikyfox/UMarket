class CreateFollowmarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :followmarkets do |t|
      t.integer :buyer_id
      t.integer :market_followed_id

      t.timestamps
    end
	
    add_index :followmarkets, :buyer_id
    add_index :followmarkets, :market_followed_id
    add_index :followmarkets, [:buyer_id, :market_followed_id], unique: true

  end
end
