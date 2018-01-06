class User < ActiveRecord::Base
  require 'bcrypt'
  has_many :jobs
  
  before_save {self.email = email.downcase }
  before_save {self.role ||= :standard }
  
  validates :email,
                presence: true,
                uniqueness: { case_sensitive: false },
                length: {minimum: 3, maximum: 254 }
  #validates :password, presence: true, length: {minimum: 6}
  
  #has_secure_password
  
  enum role: [:standard, :admin]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

end
