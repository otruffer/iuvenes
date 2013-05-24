class CreateVerbindungs < ActiveRecord::Migration
  def change
    create_table :verbindungs do |t|
      t.string :name
      t.string :ort

      t.timestamps
    end
  end
end
