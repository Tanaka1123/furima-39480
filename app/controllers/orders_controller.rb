class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :authorize_order!, only: [:index, :create]
  before_action :set_order_address, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path, notice: 'Order created successfully.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, token: params[:token], item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_order_address
  @item = Item.find(params[:item_id])
  end

  def authorize_order!
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    elsif @item.order
      redirect_to root_path, alert: 'This item has already been purchased.'
    end
  end
end
