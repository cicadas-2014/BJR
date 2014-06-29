class Round < ActiveRecord::Base
  belongs_to :user
  has_many :racers
  belongs_to :winner, class_name: "Racer"

  def set_winner
    racers = []
    self.racers.each do |racer|
      racer.odds.times { |n| racers << racer }
    end
    self.winner = racers.sample
  end

  def set_payout
    self.payout = self.winner.bet * self.winner.odds + self.winner.bet
  end
end
