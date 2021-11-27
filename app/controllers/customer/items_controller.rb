class Customer::ItemsController < ApplicationController
    
    def index
      @items = Item.all
      @genres = Genre.all
    end
    
    def show
      @item  = Item.find(params[:id])
      @image = @item.image
      @genres = Genre.all
      @cart_items = CartItem.new
    end
    
  
end
