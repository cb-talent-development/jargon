# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :locale do
    sequence(:name) { |n| "Locale #{n}" }
    data Key1: 'Value1', Key2: 'Value2'

    trait :with_json do
      json 'Key1' => 'Value1', 'Key2' => 'Value2'
    end
  end
end
