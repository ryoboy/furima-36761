class Item < ApplicationRecord





  

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_status
  belongs_to :product_type
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :shipping_day
  

end
