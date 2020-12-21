FactoryBot.define do
  factory :user do
    first_name {"太郎"}
    last_name  {"山田"}
    first_name_reading {"タロウ"}
    last_name_reading  {"ヤマダ"}
    nickname   {"test"}
    birthday   {"2020-01-01"}
    email {"test@test"}
    password {"a123456"}
    password_confirmation {password}
  end
end