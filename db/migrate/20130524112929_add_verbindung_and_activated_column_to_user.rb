class AddVerbindungAndActivatedColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :verbindung_id, :integer
    add_column :users, :activated, :boolean
  end
end
