require 'spec_helper'

describe 'Users' do
  let(:username){ "Jess" }
  let(:password){ "Judy" }
  let(:user){ create :user }

  it 'has a username' do
    expect(user.username).to_not eq(nil)
  end

  it 'has a password_digest' do
    expect(user.password_digest).to_not eq(nil)
  end

  context "doesn't validate" do
    it 'when username is not given' do
      expect{User.create(password: password)}.to change(User, :count).by(0)
    end

    it 'when password is not given' do
      expect{User.create(username: username)}.to change(User, :count).by(0)
    end

    it 'when username exists already' do
      User.create(username: username, password: password)
      expect{User.create(username: username, password: password)}.to change(User, :count).by(0)
    end
  end
end
