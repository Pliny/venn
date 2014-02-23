FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "dude#{n}@example.com" }
  end
end
