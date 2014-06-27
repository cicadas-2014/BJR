class Racer < ActiveRecord::Base
  has_many :round_racers
  has_many :rounds, through: :round_racers
end
