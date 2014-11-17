FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user-#{n}@mail.com" }
    password 'secret'
  end

  factory :room do
    sequence(:name) { |n| "room-#{n}" }
    topic 'What are the main problems at StartupBus'
    association :owner, factory: :user
  end

  factory :problem do
    description 'Not enough internet'
    user
    room
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
