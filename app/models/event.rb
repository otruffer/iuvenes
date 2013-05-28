class Event < ActiveRecord::Base
  attr_accessible :content, :date, :title, :verbindung, :users

  validates :title, :presence => true
  validates :date, :presence => true
  validates :verbindung, :presence => true

  belongs_to :verbindung
  has_and_belongs_to_many :users
end
