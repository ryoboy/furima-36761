FactoryBot.define do
  factory :item do

    product_name              { Faker::Name.initials(number: 2) }
    description                 { Faker::Internet.free_email }
    product_type_id              { '1a' + Faker::Internet.password}
    product_status_id { password }
    shipping_charge_id              { Faker::Date.backward }
    shipping_area_id            { person.last.kanji }
    shipping_day_id                  { person.first.kanji }
    price                      { person.last.katakana }
    name_reading               { person.first.katakana }
    image
  end
end
