class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def new
    @order = Order.new
     @item = Item.find(params[:item_id])
    # 必要なデータを設定するなどの処理を追加することもあります
  end

  def create
    @order = Order.new(order_params)
    # 注文作成のロジックを実装します
    if @order.save
      # 注文が保存された場合の処理
      redirect_to root_path, notice: "注文が完了しました。"
    else
      # 注文が保存されなかった場合の処理
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    # 注文作成時に許可するパラメータを指定します
    params.require(:order).permit(:user_id, :item_id, :purchase_date, :purchase_price, :payment_status, :delivery_status)
  end
end