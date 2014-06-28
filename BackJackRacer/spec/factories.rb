FactoryGirl.define do
  factory :user do
    password = Faker::Internet.password
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end

  factory :logged_in_user, class: User do
    password = 'password'
    name { Faker::Name.name }
    email { 'email@email.com' }
    password { password }
    password_confirmation { password }
  end
end