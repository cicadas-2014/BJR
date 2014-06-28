require 'spec_helper'
require 'pry'
describe 'Rounds' do 
  # include Rspec::Rails::ControllerExampleGroup
  describe 'Start round' do
    let!(:user){create(:logged_in_user)}
    it 'successfully start the game' do
      #post signin_path, controller: "users", user: {email: 'email@email.com', password: 'password'}
      ######### find a way to do this!! ###########
      visit index_path
      fill_in "signup_name", with: 'Kevin Zhou'
      fill_in "signup_email", with: 'email@email.com'
      fill_in "signup_password", with: 'password!!!'
      click_button "Sign Up"
      ############################################
      visit new_round_path
      # click_button "Start round"
      # expect(current_path).to eq(round_path)
    end
  end
end