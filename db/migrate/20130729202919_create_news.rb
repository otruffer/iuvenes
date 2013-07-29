class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :content
      t.string :title
      t.date :date
      t.references :verbindung

      t.timestamps
    end
    add_index :news, :verbindung_id
  end
end
