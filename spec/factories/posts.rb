FactoryBot.define do
  factory :post do
    start_time {"2020-01-01 00:00:00"}
    title {"test"}
    reason {"test"}
    memo   {"test"}
    association :user
    association :category
  end
end