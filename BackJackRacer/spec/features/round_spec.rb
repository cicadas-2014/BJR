require 'spec_helper'

describe 'Rounds', :js => true do
    let(:user){User.create(username:'username',password:'password')}
  before(:each) do
    #post signin_path, controller: "users", user: {username: 'username@username.com', password: 'password'}
    visit index_path
    fill_in "signup_username", with: 'username'
    fill_in "signup_password", with: 'password!!!'
    click_button "Sign Up"
  end
  describe 'Start round' do
    it 'successfully start the game' do
      visit new_round_path
      click_button "Start round"
      expect(page).to have_text("round")
    end
  end
  describe 'Bet' do
    it 'can place bets, if you have enough money' do
      visit new_round_path
      fill_in "bet_1", with: '1'
      fill_in "bet_2", with: '2'
      fill_in "bet_3", with: '3'
      fill_in "bet_4", with: '4'
      click_button "Start round"
      expect(page).to have_text("round")
    end
    it "cant place bets, if you don't have enough money" do
      visit new_round_path
      fill_in "bet_1", with: '200'
      fill_in "bet_2", with: '300'
      fill_in "bet_3", with: '400'
      fill_in "bet_4", with: '500'
      expect(page).not_to have_text("round")
      expect(page).to have_text("You cant bet that much :(")
    end
    it 'start with 1000 money' do
      visit new_round_path
      expect(page).to have_text("Your current balance is: 1000")
    end
  end
end
