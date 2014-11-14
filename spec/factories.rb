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
    association :problem, factory: :problem
    association :user, factory: :user
  end

  factory :registration do
    association :user, factory: :user
    association :room, factory: :room
  end
end
