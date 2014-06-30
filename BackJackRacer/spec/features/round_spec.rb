require 'spec_helper'

describe 'Rounds' do
  let(:user){User.create(username:'username',password:'password',funds: 1000)}

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
    # it "can't place bets if you don't have enough money", :js => true do
    #   visit new_round_path
    #   fill_in "bet_1", with: '2000'
    #   fill_in "bet_2", with: '3000'
    #   fill_in "bet_3", with: '4000'
    #   fill_in "bet_4", with: '5000'
    #   expect(page).not_to have_text("round")
    #   expect(page).to have_text("You cant bet that much :(")
    # end
    it 'start with 1000 funds' do
      visit new_round_path
      expect(page).to have_text("Your current balance is: 1000")
    end
  end

  describe 'Watch Race' do
    context "the race is over" do
      # it 'displays the winner' do
      #   pending("Pending until we figure out how to test JS, if it's possible")
      # end
      # it 'displays a button to go to the results page' do
      #   pending("Pending until we figure out how to test JS, if it's possible")
      # end
    end
  end

  describe 'View Round Results' do
    let!(:round) { create :round }
    let!(:racer_1) { Racer.create(bet: 1, odds: 1, round: round) }
    let!(:racer_2) { Racer.create(bet: 2, odds: 2, round: round) }
    let!(:racer_3) { Racer.create(bet: 3, odds: 3, round: round) }
    let!(:racer_4) { Racer.create(bet: 4, odds: 4, round: round) }
    it 'displays the winner' do
      round.set_winner
      round.set_payout
      visit round_results_path(round.id)
      expect(page).to have_text("Racer")
      expect(page).to have_text("won!")
    end
    it 'displays the total payout' do
      round.set_winner
      round.set_payout
      visit round_results_path(round.id)
      expect(page).to have_text("Your payout is: ")
    end
    it 'displays a link to start a new round' do
      round.set_winner
      round.set_payout
      visit round_results_path(round.id)
      expect(page).to have_link("New Round")
    end
    it "displays user's funds" do
      round.set_winner
      round.set_payout
      visit round_results_path(round.id)
      expect(page).to have_text("Remaining funds:")
    end
  end
end
