class Admin::OrdersController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order_histories = OrderHistry.where(order_id: order.id)
    order.update(order_params)
    if params[:order][:order_status] == "入金確認"
       order_histories.each do |order_histry|
         order_histry.update(production_status: 1)
       end
    end
    redirect_to request.referer
  end

  private
  def order_params
    params.require(:order).permit(:order_status, :item_id, :order_histry)
  end
  def order_histry_params
    params.require(:order_histry).permit(:production_status)
  end

end
