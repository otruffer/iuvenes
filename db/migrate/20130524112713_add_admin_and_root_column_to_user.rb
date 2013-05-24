class AddAdminAndRootColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :root, :boolean
  end
end
