FactoryGirl.define do
  factory :fight do
    association :robot1, :factory => :robot
    association :robot2, :factory => :robot
    win1 true
    fight_time {Time.now}
  end
  factory :fight_invalid_request, class: :fight do
  end
end
