# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence(:email) { |n| "Example-#{n}@example.com" }
    password "Password12345"
  end
end
