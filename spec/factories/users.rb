FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000qqqq"}
    password_confirmation {password}
    last_name             {"やま"}
    first_name            {"かわ"}
    last_name_kana        {"ヤマ"}
    first_name_kana       {"カワ"}
    birth_date            {"1997-2-4"}
  end
end