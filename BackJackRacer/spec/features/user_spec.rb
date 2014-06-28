require 'spec_helper'

describe 'Users' do

  describe 'signup' do
    it 'successfully create new user' do
      visit index_path
      fill_in "signup_username", with: 'username'
      fill_in "signup_password", with: 'password!!!'
      click_button "Sign Up"
      expect(current_path).to eq(new_round_path)
    end
  end
end
