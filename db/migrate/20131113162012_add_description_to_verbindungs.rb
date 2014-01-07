class AddDescriptionToVerbindungs < ActiveRecord::Migration
  def self.up
    add_column :verbindungs, :description, :string, :default => '', :null => false
  end

  def self.down
    remove_column :verbindungs, :description
  end
end
