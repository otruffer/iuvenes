class CreatePruegelEntites < ActiveRecord::Migration
  def change
    create_table :pruegel_entities do |t|
      t.text :content
      t.string :title
      t.string :type
      t.references :verbindung
    end
    add_index :pruegel_entities, :verbindung_id
  end
end
