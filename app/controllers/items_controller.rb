class ItemsController < ApplicationController
  def index
  end


private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :product_type_Id, :product_status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end