require 'spec_helper'

RSpec.describe Round, :type => :model do
  let(:round) { create :round }

  it "belongs to a user" do
    expect(round.user).to_not eq(nil)
  end
end
