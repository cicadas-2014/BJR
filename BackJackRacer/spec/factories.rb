FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password }
  end

  factory :round do
    user
  end

  factory :racer do
    round
    max_steps { rand(1..10) }
    odds { rand(1..10) }
    bet { rand(100..10000) }
  end
end
