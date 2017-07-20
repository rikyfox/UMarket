class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin, :boolean, default: false  # we’ve added the argument default: false to add_column , which means
                                                         #that users will not be administrators by default
  end
end
