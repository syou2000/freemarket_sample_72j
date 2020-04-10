FactoryBot.define do

  factory :address do
    last_name                 {"山田"}
    first_name                {"太郎"}
    last_name_hurigana        {"ヤマダ"}
    first_name_hurigana       {"タロウ"}
    zip_code                  {"0773454"}
    prefecture                { Prefecture.all.sample }
    city                      {"旭川市"}
    house_number              {"1-1-1"}
    building                  {"ヤッホービル"}
    phone_number              {"08012345678"}
    user
  end

end
