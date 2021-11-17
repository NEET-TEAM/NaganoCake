class ItemsController < ApplicationController
    
    def new
      @item = Item.new
    end
    
    def create
      @item = Item.new(item.params)
      @item.save
    end
    
    def index
      @items = Item.all
    end
    
    def show
      @item  = Item.find[:id]
      @image = @item.image.page(params[:id]).reverse_order
    end
    
    def edit
    end
    
    def uodate
    end
    
    private
    def item_params
      params.require(:item).permit(:id, :name, :explanation, :prace)
    end
end
