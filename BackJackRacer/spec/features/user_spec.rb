require 'spec_helper'

describe 'Users' do
  let(:user) { create :user }
  describe 'User can create a new account' do
    it 'by filling out the sign up form' do
      visit root_path
      fill_in "signup_username", with: 'username'
      fill_in "signup_password", with: 'password!!!'
      click_button "Sign Up"
      expect(current_path).to eq(new_round_path)
    end
  end

  describe "login" do
    let(:admin) { User.create( username: "admin", password: "password") }
    context "with valid information" do
      it "redirects to the start round page" do
        visit root_path
        fill_in "username", with: admin.username
        fill_in "password", with: admin.password
        click_button "Login"
        expect(current_path).to eq(new_round_path)
      end
    end
    context "with invalid information" do
      it "displays errors" do
        visit root_path
        fill_in "username", with: "bad"
        fill_in "password", with: "wrong"
        click_button "Login"
        expect(page.body).to have_content("Invalid login")
      end
    end
  end

  describe "User logout" do
    let(:admin) { User.create( username: "admin", password: "password") }
    context "clicks Logout link" do
      it "redirects to the login page" do
        visit root_path
        fill_in "username", with: admin.username
        fill_in "password", with: admin.password
        click_button "Login"
        click_link "Logout"
        expect(current_path).to eq root_path
      end
    end
  end

  describe 'profile' do
  	let!(:user) { create :user }
  	it 'displays a username' do
  		visit user_path(user.id)
  		expect(page).to have_content(user.username)
  	end

  	it 'displays funds for the user' do
  		visit user_path(user.id)
  		expect(page).to have_content(user.funds)
  	end
  end

end
