class Admin::OrderHistriesController < ApplicationController
    
    before_action :authenticate_admin!

     def update
       order_histry = OrderHistry.find(params[:id])
       order = order_histry.order
       order_histries = OrderHistry.where(order_id: order.id)
       order_histry.update!(order_histry_params)
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

  # def update
  #   order_histry = OrderHistry.find(params[:id])
  #   if params[:order_histry][:production_status] == "製作中"
  #     order_histry.update(production_status: 2)
  #     order = Order.find_by(id: order_histry.order_id)
  #     order.update(order_status: 2)
  #     redirect_to request.referer
  #   elsif params[:order_histry][:production_status] == "制作完了"
  #     order_histry.update(production_status: 3)
  #     order_histries = OrderHistry.where(order_id: order_histry.order_id)
  #     a = 0
  #     order_histries.each do |order_histry|
  #       unless order_histry.prduction_status != "制作完了"
  #         a += 1
  #       end
  #     end
  #     if a == order_histries.size
  #       order = Order.find_by(id: order_histry.order_id)
  #       order.update(order_status: 3)
  #       redirect_to request.referer
  #     else
  #       redirect_to request.referer
  #     end
  #   else
  #     order_histry.update(production_status: (OrderHistry.production_statuses[:order_histry][:production_status].to_sym).to_i)
  #     redirect_to request.referer
  #   end
  # end

  private
  def order_histry_params
    params.require(:order_histry).permit(:production_status)
  end

end
