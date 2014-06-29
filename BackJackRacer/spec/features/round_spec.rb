require 'spec_helper'

describe 'Rounds', :js => true do
  let(:user){User.create(username:'username',password:'password')}

  before(:each) do
    visit root_path
    fill_in "signup_username", with: 'username'
    fill_in "signup_password", with: 'password!!!'
    click_button "Sign Up"
  end

  describe 'Starting a round' do
    it 'can place bets if you have enough money' do
      visit new_round_path
      fill_in "bet_1", with: '1'
      fill_in "bet_2", with: '2'
      fill_in "bet_3", with: '3'
      fill_in "bet_4", with: '4'
      click_button "Start round"
      expect(current_path).to_not eq(new_round_path)
    end
    it "can't place bets if you don't have enough money" do
      visit new_round_path
      fill_in "bet_1", with: '200'
      fill_in "bet_2", with: '300'
      fill_in "bet_3", with: '400'
      fill_in "bet_4", with: '500'
      expect(page).not_to have_text("round")
      expect(page).to have_text("You cant bet that much :(")
    end
    it 'start with 1000 funds' do
      visit new_round_path
      expect(page).to have_text("Your current balance is: 1000")
    end
  end

  describe 'Watch Race' do
    context "the race is over" do
      it 'displays the winner'
      it 'displays a button to go to the results page'
    end
  end

  describe 'Results page' do
    it "has a link to rounds/new" do
      pending
    end
  end
end
