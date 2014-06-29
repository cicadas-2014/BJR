require 'spec_helper'

RSpec.describe Round, :type => :model do
  let(:round) { create :round }

  it "belongs to a user" do
    expect(round).to respond_to(:user)
  end

  it "has a payout field" do
    expect(round).to respond_to(:payout)
  end

  it "has a winner field" do
    expect(round).to respond_to(:winner)
  end

  context "has a set_winner method" do
    it "looks at all of the round's racers' odds, sets the round's winner to a racer object, and returns the integer of the racer" do
      4.times { |n| Racer.create( odds: n+1, round: round) }
      expect(round.set_winner).to be_a(Fixnum)
      expect(round.winner).to be_a(Racer)
    end
  end

  context "has a set_payout method" do
    it "looks at all of the round's racers' odds and bets and returns an integer representing the payout" do
      4.times { |n| Racer.create( odds: n+1, bet: 2, round: round) }
      round.set_winner
      expect(round.set_payout).to eq(round.winner.bet * round.winner.odds + round.winner.bet)
    end
  end
end
