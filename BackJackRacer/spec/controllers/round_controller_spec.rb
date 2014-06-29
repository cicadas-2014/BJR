require 'spec_helper'

describe RoundsController do
  describe 'post #create' do
    it "creates a new round" do
     expect{
       post :create, bet_1: 1, bet_2: 1, bet_3: 1, bet_4: 1
       }.to change(User,:count).by(1)
     end

     it "redirects to the show round page" do
      post :create, user: {username: "asdf", password: "asdf"}
      expect(response).to redirect_to new_round_path
    end
  end
end
