class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, ,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :cerevis, :activated, :admin, :root, :verbindung_id
  belongs_to :verbindung

  validates :email, :uniqueness => true
  validates :verbindung_id, :presence => true
end
