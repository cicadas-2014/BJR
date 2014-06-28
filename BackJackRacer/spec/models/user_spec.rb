require 'spec_helper'

describe 'Users' do
  let(:user){ User.new(username: 'asdf', password: 'asdf') }
  let(:user2){ User.new(username:'Judy', password: 'asdf') }

  context 'is invalid' do
    it 'when username is not given'

    it 'when password is not given'
  end
end
