FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image_.png'), filename: 'flag.png')
    end
    product_name                { Faker::Name.initials(number: 2) }
    description                 { '説明だよ' }
    product_type_id             { 2 }
    product_status_id           { 2 }
    shipping_charge_id          { 2 }
    shipping_area_id            { 2 }
    shipping_day_id             { 2 }
    price                       { 1000 }
    association :user
  end
end
