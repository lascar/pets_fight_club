FactoryGirl.define do
  factory :pet do
    sequence(:name) { |n| "name#{n}" }
    birth_day Time.now - 2.years
    user

    trait :associated do
    end
  end

  factory :pet_invalid_request, class: Pet do
    name nil
  end
end
