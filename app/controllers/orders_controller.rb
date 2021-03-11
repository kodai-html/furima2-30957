class OrdersController < ApplicationController
  before_action :set_params, only: [:index, :create, :pay_item, :move_to_index]
  before_action :move_to_index, only: [:index, :create]

  def index
    @address_order = AddressOrder.new
  end

  def create
    @address_order = AddressOrder.new(address_order_params)
    #Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if @address_order.valid?
      pay_item
      @address_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_order_params
    params.require(:address_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: address_order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
