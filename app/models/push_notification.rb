class PushNotification < ActiveRecord::Base

  attr_accessible :user_id, :device_os, :device_id, :device_name, :device_description

  validates :device_os, :presence => true
  validates :device_id, :presence => true
  validates :device_name, :presence => true
end