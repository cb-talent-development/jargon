# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :localization do
    sequence(:name) { |n| "Localization #{n}" }
    owner
  end
end
