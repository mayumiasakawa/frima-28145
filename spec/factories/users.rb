FactoryBot.define do
  factory :user do
    first_name          {"山田"}
    last_name           {"花子"}
    first_name_kana     {"ヤマダ"}
    last_name_kana      {"ハナコ"}
    nickname            {"yamada"}
    birthday            {"19300101"}
    email               {"kkk@gmail.com"}
    password            {"aaa111"}
    encrypted_password  {password}
  end 
end
