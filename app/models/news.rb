class News < ActiveRecord::Base
  belongs_to :verbindung
  attr_accessible :content, :date, :title

  validates :title, :presence => true
  validates :date, :presence => true
  validates :verbindung, :presence => true
end
