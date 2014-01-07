class CreatePushNotificationTable < ActiveRecord::Migration
  def change
    create_table :push_notifications do |t|
      t.integer :user_id
      t.string :device_os
      t.string :device_id
      t.string :device_name
      t.string :device_description

      t.timestamps
    end
  end
end
