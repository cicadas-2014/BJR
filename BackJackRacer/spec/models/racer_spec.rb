require 'spec_helper'

RSpec.describe Racer, :type => :model do
  let(:racer) { create :racer }

  it "has odds" do
    expect(racer).to respond_to(:odds)
  end

  it "has a bet" do
    expect(racer).to respond_to(:bet)
  end

  it "belongs to a round" do
    expect(racer).to respond_to(:round)
  end
end
