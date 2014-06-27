class User < ActiveRecord::Base
  has_many :rounds
  
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email

  has_secure_password
end
