FactoryBot.define do
  factory :medicine do
    name {"test"}
    start_time {"2020-01-01 00:00:00"}
    memo {"test"}
    association :user

    after(:build) do |medicine|
      medicine.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end