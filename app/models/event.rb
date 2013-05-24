class Event < ActiveRecord::Base
  attr_accessible :content, :date, :title, :verbindung

  validates :title, :presence => true
  validates :date, :presence => true
  validates :verbindung, :presence => true

  belongs_to :verbindung
  has_many :users
end
