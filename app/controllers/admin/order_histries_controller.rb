class Admin::OrderHistriesController < ApplicationController

  def update
    order_histry = OrderHistry.find(params[:id])
    order = order_histry.order
    order_histries = OrderHistry.where(order_id: order.id)
    order_histry.update(order_histry_params)
    if params[:order_histry][:production_status] == "製作中"
      order.update(order_status: 2)
      redirect_to request.referer
    elsif params[:order_histry][:production_status] == "制作完了"
      if order_histries.all?{|order_histry| order_histry.production_status == "制作完了"}
        order.update(order_status: 3)
      end
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private
  def order_histry_params
    params.require(:order_histry).permit(:production_status)
  end

end
