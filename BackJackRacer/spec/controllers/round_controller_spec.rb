require 'spec_helper'

describe RoundsController do
  describe 'post #create' do
    it "creates a new round and sets it to round" do
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

     it "redirects to #show" do
      post :create, user_id: 1, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
      expect(response).to redirect_to(round_path(assigns(:round).id))
    end
  end

  describe 'get #show' do
    let!(:user) { User.create(username:"asdf",password:"asdf") }
    let!(:round) { Round.create(user: user) }
    let!(:racer1) { Racer.create(bet: 1, odds: 1,round:round) }
    let!(:racer2) { Racer.create(bet: 2, odds: 2,round:round) }
    let!(:racer3) { Racer.create(bet: 3, odds: 3,round:round) }
    let!(:racer4) { Racer.create(bet: 4, odds: 4,round:round) }
    it "calls set_winner and set_payout on @round" do
      get :show, id: user.id
      expect(assigns(:round).winner).to_not be_nil
      expect(assigns(:round).payout).to_not be_nil
    end

    it "renders the round/show page" do
      get :show, id: user.id
      expect(response).to render_template(:"rounds/show")
    end
  end

  describe 'get #results' do
    let!(:round) { create :round }
    let!(:user) { create :user }
    it "sets @round to the current round and @user to the round's user" do
      post :create, user_id: 1, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
      get :results, id: round.id
      expect(assigns(:round)).to_not be_nil
      expect(assigns(:user)).to_not be_nil
    end
  end
end
