FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user-#{n}@mail.com" }
    password 'secret'
  end

end

