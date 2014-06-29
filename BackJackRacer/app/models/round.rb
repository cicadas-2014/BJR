class Round < ActiveRecord::Base
  belongs_to :user
  has_many :racers

  def set_winner
    racers = []
    self.racers.each do |racer|
      racer.odds.times { |n| racers << racer.id }
    end
    self.winner = racers.sample
  end

  def set_payout
    racer = Racer.find(self.winner)
    self.payout = racer.bet * racer.odds + racer.bet
  end
end
