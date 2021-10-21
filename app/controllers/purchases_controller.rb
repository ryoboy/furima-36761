class PurchasesController < ApplicationController

  before_action :set_purchase_address,only: [:new, :create]
  before_action :authenticate_user!,only: [:new, :create]

  def index
    
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(donation_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_purchase_address
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end



end
