class Round < ActiveRecord::Base
  belongs_to :user
  has_many :racers
  belongs_to :winner, class_name: "Racer"

  def set_winner
    racers = []
    self.racers.each_with_index do |racer, index|
      racer.odds.times { |n| racers << [racer,index+1] }
    end
    winner = racers.sample
    self.winner = winner[0]
    return winner[1]
  end

  def set_payout
    self.payout = self.winner.bet * self.winner.odds + self.winner.bet
  end
end
