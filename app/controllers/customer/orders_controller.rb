class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)
  end
  
  def check
    @cart_items = current_customer.cart_items
  end
  
  def create
    customer = current_customer
    
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
        session[:order][:postal_code] = customer.postal_code.to_i
        session[:order][:address] = customer.address
        session[:order][:name] = customer.full_name
        
      elsif destination == 1
        address = Address.find(params[:address_for_order])
        session[:order][:postal_code] = address.postal_code.to_i
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
  end
  

  
  def thanks
    order = Order.new(session[:order])
    order.save
    
    if session[:new_address]
      address = current_customer.addresses.new
      address.postal_code = order.postal_code
      address.address = order.address
      address.name = order.name
      address.save
      session[:new_address] = nil
    end
    
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_histries = OrderHistry.new
      order_histries.order_id = order.id
      order_histries.item_id = cart_item.item.id
      order_histries.quantity = cart_item.quantity
      order_histries.production_status = 0
      order_histries.price = (cart_item.item.add_tax_price).floor
      order_histries.save
    end
    
    session.delete(:order)
    session[:order] = nil
    cart_items.destroy_all
    
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def index
    @order = current_customer.orders
  end
  
  def edit
  end
  
  
  
end
