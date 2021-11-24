class Admin::OrderHistoriesController < ApplicationController

  def update
    @order_histories = OrderHistry.find(params[:id])
    @order_histories.update(order_histories_params)
    if @order_histories.exists?(production_status: "製作中")
       @order_histories.order.order_status.update(order_status: "製作中")
    else
      @order_histories.production_status.all(production_status: "制作完了")
      @order_histories.order.order_status.update(order_status: "発送準備中")
    end
  end

  private
  def order_histories_params
    params.require(:order_histories).permit(:production_status)
  end

end
