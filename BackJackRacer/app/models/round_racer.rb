class RoundRacer < ActiveRecord::Base
  belongs_to :rounds
  belongs_to :racers
end
