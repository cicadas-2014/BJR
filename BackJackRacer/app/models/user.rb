class User < ActiveRecord::Base
  after_initialize :init
  has_many :rounds

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password

  has_secure_password

  def init
    self.funds = 1000
  end
end
