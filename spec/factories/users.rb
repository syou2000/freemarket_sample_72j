FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"111111a"}
    password_confirmation {"111111a"}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
    year                  {"1900"}
    month                 {"1"}
    day                   {"1"}
  end

end