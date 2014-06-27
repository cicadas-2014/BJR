require 'spec_helper'

describe 'User' do
  let(:user){ User.new(name:'Jess',email: 'j@j.com')}
  let(:user2){ User.new(name:'Judy',email: 'j@j.com')}

  context 'is invalid' do
    it 'when name is not given' do
      user.name = ''
      user.save
      user.should_not be_valid  
    end

    it 'when email is not given' do
      user.email = ''
      user.save
      user.should_not be_valid
    end

    context 'is valid' do
    it 'when name is not given' do
      user.should be_valid  
    end
  end
  end
end
