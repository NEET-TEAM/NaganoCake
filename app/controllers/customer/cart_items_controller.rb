class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
  
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    
    item_id = params[:cart_item][:item_id]
    quantity = params[:cart_item][:quantity]
    cart_item = current_customer.cart_items.find_by(item_id: item_id)
    
    if cart_item.present?
      cart_item.quantity = quantity.to_i
      cart_item.save
      redirect_to cart_items_path
      
    elsif @cart_item.save
      redirect_to cart_items_path
      
    else
      @item = Item.find_by(id:@cart_item.item_id)
      @genres = Genre.all
      @cart_items = CartItem.new
      
      redirect_to customer_items_path
      
    end
  end
  
  def destroy
  end
  
  private

  def cart_item_params
    params.permit(:item_id, :quantity)
  end
end
