require 'spec_helper'

describe 'UsersController' do
  let(:user) { create :user }
  describe '#create' do
    it 'successfully create new user' do
      visit index_path
      fill_in "signup_username", with: 'username'
      fill_in "signup_password", with: 'password!!!'
      click_button "Sign Up"
      expect(current_path).to eq(new_round_path)
    end
  end

  describe '#signin' do

    it 'sets an existing user to @user'
    it
  end

end
