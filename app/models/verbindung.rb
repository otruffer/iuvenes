class Verbindung < ActiveRecord::Base
  attr_accessible :name, :ort, :logo, :first_color, :second_color, :third_color
  has_attached_file :logo, :styles => {:medium => '200x200', :small => '100x100', :xsmall => '50x50'}, :default_url => '/images/:style/missing.png'
  has_many :users

  validates :name, :presence => true
  #validates :first_color, :css_hex_color => true
  #validates :second_color, :css_hex_color => true
  #validates :third_color, :css_hex_color => true
  validates_attachment :logo,
    :content_type => { :content_type => "image/png"},
    :size => { :in => 0..1.megabytes}

  def get_unapproved_members
    return User.where(:verbindung_id => self.id, :approved => false)
  end


end
