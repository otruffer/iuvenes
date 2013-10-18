class PruegelEntity < ActiveRecord::Base
  belongs_to :verbindung
  attr_accessible :content, :type, :title

  validates :title, :presence => true
  validates :type, :presence => true
  validates :verbindung, :presence => true
end