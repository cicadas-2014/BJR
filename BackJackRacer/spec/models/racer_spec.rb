require 'spec_helper'

RSpec.describe Racer, :type => :model do
  let(:racer) { create :racer }

  it "has odds" do
    expect( racer.max_steps ).to_not eq(nil)
  end

  it "has a bet" do
    expect( racer.max_steps ).to_not eq(nil)
  end

  it "belongs to a round" do
    expect( racer.max_steps ).to_not eq(nil)
  end
end
