class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, ,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :cerevis, :activated, :admin, :root, :verbindung_id, :name, :approved
  belongs_to :verbindung

  validates :email, :uniqueness => true
  validates :name, :presence => true
  validates :verbindung_id, :presence => true

  def active_for_authentication?
    super && (approved? || root?)
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end
end
