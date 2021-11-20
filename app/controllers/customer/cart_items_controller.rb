class Customer::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  
  end
  
  def create
    @cart_item = @customer.cart_item.new(cart_item_params)
    @current_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: 
    @cart_item.customer_id)
    # カートに同じ商品がなければ新規追加、あれば既存のデータと合算
    if @current_item.blank?
      @cart_item.save
      redirect_to cart_items_path
    else
      @current_item.quantity += params[:quantity].to_i
      new_quantity = @cart_item.quantity + @current_item.quantity
      @current_item.update(quantity: new_quantity)
      redirect_to cart_items_path
    end
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to request.referer
  end
  
  
  
  private

  def cart_item_params
    params.permit(:item_id, :quantity, :customer_id)
  end
end
