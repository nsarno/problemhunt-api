FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user-#{n}@mail.com" }
    password 'secret'
  end

  factory :room do
    sequence(:name) { |n| "room-#{n}" }
  end

  factory :problem do
    description "Spiders! Spiders everywhere!"
    association :room, factory: :room
  end

  factory :upvote do
    problem
    user
  end

  factory :registration do
    user
    room
  end
end
