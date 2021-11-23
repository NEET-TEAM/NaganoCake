class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @orders = Order.find(params[:id])
    @order_histories = @order.order_histories
  end

  def update
    @order = Order.find(params[:id])
    @order_histories = @order.order_histories
    @order.update(order_params)
    if order_status == "入金確認"
       order_histories.production_status.update_all(production_status: "制作待ち")
    else
       redirect_to admin_order_path(@order)
    end
  end

  private
  def orders_params
    params.require(:order).permit(:order_status)
  end

end
