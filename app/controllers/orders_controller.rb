class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.last
     @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       @order_address.save
      redirect_to root_path
    else
      @item = Item.last
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:item_id, :postal_code, :prefecture, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id)
  end

end