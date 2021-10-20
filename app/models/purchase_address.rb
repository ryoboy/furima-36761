class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :item_id, :user_id, :token
  with_options  presence: true do
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\d{10,11}/}
    validates :postal_code, format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 , message: "を選択してください"}
    validates :user_id
    validates :item_id
    validates :token
    end
    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number:house_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
   end
end