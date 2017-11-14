class User < ActiveRecord::Base
  require 'bcrypt'
  has_many :collaborators
  has_many :wikis, through: :collaborators
  accepts_nested_attributes_for :collaborators
  accepts_nested_attributes_for :wikis
  
  before_save {self.email = email.downcase }
  before_save {self.role ||= :standard }
  
  validates :email,
                presence: true,
                uniqueness: { case_sensitive: false },
                length: {minimum: 3, maximum: 254 }
  #validates :password, presence: true, length: {minimum: 6}
  
  #has_secure_password
  
  enum role: [:standard, :premium, :admin]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
         

  def upgrade
    self.role = :premium
  end
  
  def collaborators
    Collaborator.where(user_id: id)
  end
  
  def wikis
    collaborators.wikis
  end
end
