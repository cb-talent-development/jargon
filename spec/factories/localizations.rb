# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :localization do
    sequence(:name) { |n| "Localization #{n}" }
    owner

    trait :without_owner do
      owner nil
    end

    trait :without_name do
      name nil
    end
  end
end
