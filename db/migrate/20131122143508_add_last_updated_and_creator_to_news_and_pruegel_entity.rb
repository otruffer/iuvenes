class AddLastUpdatedAndCreatorToNewsAndPruegelEntity < ActiveRecord::Migration
  def self.up
    add_column :pruegel_entities, :creator, :integer, :default => 0, :null => true
    add_column :pruegel_entities, :last_updated_by, :integer, :default => 0, :null => true

    add_column :news, :creator, :integer, :default => 0, :null => true
    add_column :news, :last_updated_by, :integer, :default => 0, :null => true

    add_column :events, :creator, :integer, :default => 0, :null => true
    add_column :events, :last_updated_by, :integer, :default => 0, :null => true

  end

  def self.down
    remove_column :pruegel_entities, :creator
    remove_column :pruegel_entities, :last_updated_by

    remove_column :news, :creator
    remove_column :news, :last_updated_by

    remove_column :events, :creator
    remove_column :events, :last_updated_by
  end
end
