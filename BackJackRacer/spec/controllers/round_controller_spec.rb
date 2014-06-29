require 'spec_helper'

describe RoundsController do
  describe 'post #create' do
    it "creates a new round and sets it to @round" do
      expect{
       post :create, user_id: 1, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
       }.to change(Round,:count).by(1)
       expect(assigns(:round)).to_not be_nil
    end

    it "creates 4 new racers" do
     expect{
       post :create, user_id: 1, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
       }.to change(Racer,:count).by(4)
    end

    it "calls set_winner and set_payout on @round" do
      post :create, user_id: 1, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
      expect(assigns(:round).winner).to_not be_nil
      expect(assigns(:round).payout).to_not be_nil
    end

    it "renders the round/show page" do
      post :create, user_id: 1, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
      expect(response).to render_template(:"rounds/show")
    end
  end

  describe 'post #results' do
    let!(:round) { create :round }
    let(:racer1) { Racer.create()}

  end
end
