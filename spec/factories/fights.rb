FactoryGirl.define do
  factory :fight do
    association :pet1, :factory => :pet
    association :pet2, :factory => :pet
    win1 true
    fight_time {Time.now}
  end
  factory :fight_invalid_request, class: :fight do
  end
end
