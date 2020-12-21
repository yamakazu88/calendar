FactoryBot.define do
  factory :condition do
    start_time {"2020-01-01 00:00:00"}
    temperature { 36.5 }
    weight { 62.5 }
    blood_max { 100 }
    blood_min { 70 }
    condition { 1 }
    memo {"test"}
    association :user
  end
end
