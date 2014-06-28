require 'spec_helper'
describe 'Rounds' do 
  describe 'Start round' do
    it 'successfully start the game' do
      #post signin_path, controller: "users", user: {username: 'username@username.com', password: 'password'}
      ######### find a way to do this!! ###########
      visit index_path
      fill_in "signup_username", with: 'username'
      fill_in "signup_password", with: 'password!!!'
      click_button "Sign Up"
      ############################################
      visit new_round_path
      click_button "Start round"
      expect(page).to have_content('round')
    end
  end
end