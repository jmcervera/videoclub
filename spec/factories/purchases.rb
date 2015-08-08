FactoryGirl.define do
  factory :purchase do
    user
    item
    purchased_at { Time.current }
    expire_at  { purchased_at + 2.days }
  end
end
