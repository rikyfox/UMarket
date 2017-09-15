class AddBudgetToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :budget, :integer,  default: 150, null:false
  end
end
