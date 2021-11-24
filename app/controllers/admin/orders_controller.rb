class Admin::OrdersController < ApplicationController

  def top
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if order_status == "入金確認"
       order_histories.production_status.update_all(production_status: "制作待ち")
    else
       redirect_to admin_order_path(@order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:order_status, :item_id, :order_histry)
  end

end