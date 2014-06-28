require 'spec_helper'

describe 'Users' do 

  describe 'signup' do
    let!(:user){create(:user)}
    it 'successfully create new user' do
      visit index_path
      fill_in "signup_name", with: user.name
      fill_in "signup_email", with: user.email
      fill_in "signup_password", with: user.password
      click_button "Sign Up"
      expect(current_path).to eq(new_round_path)
    end
  end
end