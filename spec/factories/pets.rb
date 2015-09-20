FactoryGirl.define do
  factory :robot do
    sequence(:name) { |n| "name#{n}" }
    birth_day Time.now - 2.years
    user

    trait :associated do
    end
  end

  factory :robot_invalid_request, class: Robot do
    name nil
  end
end
