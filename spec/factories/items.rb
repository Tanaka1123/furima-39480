FactoryBot.define do
  factory :item do
    association :user
    name { 'Sample Item' }
    price { 100_000 }
    category_id { 1 }
    condition_id { 1 }
    shipping_charge_id { 1 }
    prefecture_id { 1 }
    shipping_date_id { 1 }
    description { 'This is a sample item.' }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
