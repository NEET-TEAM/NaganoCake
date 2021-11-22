class Customer::OrdresController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)
  end
  
  def create
    @customer = current_customer
    
      session[:order] = Order.new
      cart_items = current_customer.cart_items
      
      sum = 0
      cart_items.each do |cart_item|
        sum += (cart_item.item.add_tax_price).floor * cart_item.quantity
      end
    
      session[:order][:shipping_cost] = 800
      session[:order][:total_payment] = sum + session[:order][:shipping_cost]
      session[:order][:order_status] = 0
      session[:order][:customer_id] = current_customer.id
      session[:order][:payment] = params[:payment].to_i
    
      destination = params[:select].to_i
      
      if destination == 0
        session[:order][:postal_code] = address.postal_code.to_i
        session[:order][:addres] = addres.addres
        session[:order][:name] = address.name
        
      elsif destination == 1
        address = Address.find(params[:address_for_order])
        session[:order][:address] = address.address
        session[:order][:name] = address.name
        
      elsif destination == 2
        session[:new_address] = 2
        session[:order][:postal_code] = params[:postal_code].to_i
        session[:order][:address] = params[:address]
        session[:order][:name] = params[:name]
      end
      
      if session[:order][:postal_code].presence && session[:order][:address].presence && session[:order][:name].presence
        redirect_to customer_orders_check_path
      else
        redirect_to new_customer_order_path
        
    
  end
  
  def show
  end
  
  def index
  end
  
  def edit
  end
  
  
  
end
