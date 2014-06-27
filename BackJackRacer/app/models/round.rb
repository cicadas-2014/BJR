class Round < ActiveRecord::Base
  belongs_to :user
  has_many :round_racers
  has_many :racers, through: :round_racers
end
