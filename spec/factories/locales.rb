# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :locale do
    sequence(:locale) { |n| "Locale #{n}" }
    data 'Data Data Data'
  end
end
