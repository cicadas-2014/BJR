class User < ActiveRecord::Base
  has_many :rounds
  validates_presence_of :username
  has_secure_password
end
