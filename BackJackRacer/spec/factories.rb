FactoryGirl.define do
  factory :user do
    password = Faker::Internet.password
    username { Faker::Internet.user_name }
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
