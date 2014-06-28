class User < ActiveRecord::Base

  has_many :rounds

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password

  has_secure_password

end
