class User < ActiveRecord::Base
  has_many :rounds
  before_save :init
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password_digest

  has_secure_password

  def init
    if self.funds < 100 || self.funds == nil
      self.funds = 1000
      self.save
    end
  end

  def apply_payout(payout)
    self.update_attributes(funds: self.funds + payout)
  end
end
