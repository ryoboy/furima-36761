class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_status
  belongs_to :product_type
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user
  has_one :purchase
  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :product_type_id, numericality: { other_than: 1, message: "はいずれか一つを選択してください。"}
    validates :product_status_id, numericality: { other_than: 1, message: "はいずれか一つを選択してください。"}
    validates :shipping_charge_id, numericality: { other_than: 1, message: "はいずれか一つを選択してください。"}
    validates :shipping_area_id, numericality: { other_than: 1, message: "はいずれか一つを選択してください。"}
    validates :shipping_day_id, numericality: { other_than: 1, message: "はいずれか一つを選択してください。"}
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: '¥300~¥9,999,999の間で入力してください' }
  end
end
