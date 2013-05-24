class EventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
      t.integer :user
      t.integer :event
    end
  end
end