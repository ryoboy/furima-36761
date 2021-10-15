class Item < ApplicationRecord


  with_options presence: true do

    validates :image
    validates :product_name
    validates :description
    validates :price
  end

    validates :product_type_id, numericality: { other_than: 1 } 
    validates :product_status_id, numericality: { other_than: 1 } 
    validates :shipping_charge_id, numericality: { other_than: 1 } 
    validates :shipping_area_id, numericality: { other_than: 1 } 
    validates :shipping_day_id, numericality: { other_than: 1 } 
    validates :price, numericality: true


    has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :product_status
    belongs_to :product_type
    belongs_to :shipping_area
    belongs_to :shipping_charge
    belongs_to :shipping_day
  

end
