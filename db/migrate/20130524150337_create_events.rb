class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.date :date
      t.references :verbindung

      t.timestamps
    end
  end
end
