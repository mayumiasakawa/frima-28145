FactoryBot.define do
  factory :item do
    name  {Faker::Name.name}
    text  {Faker::Lorem.sentence}
    category_id {2}
    status_id   {2}
    price       {1000}
    shipping_fee_id {2}
    prefecture_id   {2}
    scheduled_delivery_id {2}
  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end