FactoryBot.define do
  factory :item do
    name                  {"カード"}
    description           {"新品"}
    category_id           {2}
    condetion_id          {2}
    postage_payer_id      {2}
    prefectre_id          {2}
    handling_time_id      {2}
    price                 {2000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
