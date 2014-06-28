class Round < ActiveRecord::Base
  belongs_to :user
  has_many :racers
end
