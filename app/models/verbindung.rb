class Verbindung < ActiveRecord::Base
  attr_accessible :name, :ort
  has_many :users

  validates :name, :presence => true
end
