FactoryBot.define do
  factory :order_item do
    postal_code { '123-4567' }
    prefecture { 1 }
    city {'東京都'}
    house_number { '1-1' }
    phone_number { '1234567' }
    building_name { 'マンション名' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
