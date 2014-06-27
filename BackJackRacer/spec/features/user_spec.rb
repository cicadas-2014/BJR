require 'spec_helper'

describe 'Users' do 

  describe 'signup' do
    let!(:user){User.create(name: "Sam", email: "sam@sam.com", password: "coffee")}
    it 'successfully create new user' do
      visit index_path
      fill_in "Name", with: user.name
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign Up"
      expect(current_path).to eq(new_rounds_path)
    end
  end
end