FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user-#{n}@mail.com" }
    password 'secret'
  end

  factory :organization do
    sequence(:name) { |n| "company-#{n}" }
  end

  factory :problem do
    organization
    description "Spiders! Spiders everywhere!"
  end
end

