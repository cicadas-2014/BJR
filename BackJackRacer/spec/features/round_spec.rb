require 'spec_helper'

describe 'Rounds' do 
  describe 'Start round' do
    let!(:user){create(:user)}
    it 'successfully start the game' do
      visit new_round_path
      click_button "Start round"
      expect(current_path).to eq(round_path)
    end
  end
end