require 'spec_helper'

describe 'UsersController' do
  let(:user) { create :user }
  describe 'User can create a new account' do
    it 'by filling out the sign up form' do
      visit index_path
      fill_in "signup_username", with: 'username'
      fill_in "signup_password", with: 'password!!!'
      click_button "Sign Up"
      expect(current_path).to eq(new_round_path)
    end
  end

  describe "User login" do
    let(:admin) { User.create( username: "admin", password: "password") }
    context "valid information" do
      it "redirects to the start round page" do
        visit index_path
        fill_in "username", with: admin.username
        fill_in "password", with: admin.password
        click_button "Login"
        expect(current_path).to eq(new_round_path)
      end
    end
    context "invalid information" do
      it "displays errors"
      it ""
    end
  end

end
