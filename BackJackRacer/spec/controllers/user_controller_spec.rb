require 'spec_helper'

describe UsersController do
  describe 'get #index' do
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe 'post #create' do
    it "creates a new user" do
     expect{
       post :create, user: {username: "asdf", password: "asdf"}
       }.to change(User,:count).by(1)
     end

     it "redirects to new round page" do
      expect(
        post :create, user: {username: "asdf", password: "asdf"}
        ).to redirect_to new_round_path
    end
  end

  describe 'post #signin' do
    context "" do
    end

    context "" do
    end
  end
end
