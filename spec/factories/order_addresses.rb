FactoryBot.define do
  factory :order_addresse do
    post_code      { '176-1111' }
    prefectre_id   { 2 }
    city           { '東京' }
    house_number   { '1-1' }
    phone_number   { '176' }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
