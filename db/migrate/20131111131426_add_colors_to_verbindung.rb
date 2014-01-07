class AddColorsToVerbindung < ActiveRecord::Migration
    def self.up
      add_column :verbindungs, :first_color, :string, :default => '#444444', :null => false
      add_column :verbindungs, :second_color, :string, :default => '#444444', :null => false
      add_column :verbindungs, :third_color, :string, :default => '#444444', :null => false
    end

    def self.down
      remove_column :verbindungs, :first_color
      remove_column :verbindungs, :second_color
      remove_column :verbindungs, :third_color
    end
end
