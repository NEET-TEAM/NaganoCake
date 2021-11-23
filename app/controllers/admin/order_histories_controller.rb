class Admin::OrderHistoriesController < ApplicationController

  def update
    @order_histories = OrderHistry.find(params[:id])
    @order_histories.update(order_histories_params)

  end

  private
  def order_histories_params
    params.require(:order_histories).permit(:production_status)
  end

end
