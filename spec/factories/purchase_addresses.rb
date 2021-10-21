FactoryBot.define do
  factory :purchase_address do

    postal_code         {"123-5678"}
    shipping_area_id     { 3 }
    city              {"市町"}
    house_number      {"番地"}
    building_name     {"建物名"}
    telephone_number      {"0120333906"}
    
  end
end
