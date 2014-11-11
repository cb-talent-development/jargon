# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :locale do
    sequence(:locale) { |n| "Locale #{n}" }
    data Key1: 'Value1', Key2: 'Value2'
  end
end
