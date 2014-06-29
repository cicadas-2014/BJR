require 'spec_helper'

describe RoundsController do
  describe 'post #create' do
    it "creates a new round" do
     expect{
       post :create, user_id: 1, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
       }.to change(Round,:count).by(1)
     end

    it "creates 4 new racers" do
     expect{
       post :create, user_id: 1, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
       }.to change(Racer,:count).by(4)
     end
  end
end
