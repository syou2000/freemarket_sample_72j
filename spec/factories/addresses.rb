FactoryBot.define do

  factory :address do
    last_name                 {"山田"}
    first_name                {"太郎"}
    last_name_hurigana        {"ヤマダ"}
    first_name_hurigana       {"タロウ"}
    zip_code                  {"0773454"}
    prefecture                {"北海道"}
    city                      {"旭川市"}
    house_number              {"1-1-1"}
    building                  {"ヤッホービル"}
    phone_number              {"08012345678"}
    # last_name                 {Faker::Name.last_name}
    # first_name                {Faker::Name.first_name}
    # last_name_hurigana        {"ヤマダ"}
    # first_name_hurigana       {"タロウ"}
    # zip_code                  {Faker::Number.number(digits:7)}
    # prefecture                {"北海道"}
    # city                      {Faker::Address.city}
    # house_number              {"1-1-1"}
    # building                  {"#{Faker::Ancient.god}ビル#{Faker::Number.number(digits:3).to_s}号室"}
    # phone_number              {Faker::PhoneNumber.cell_phone}
    # phone_number              {"08012345678"}
  end

end
