class ItemsController < ApplicationController
    
    def new
      @item = Item.new
      @genres = Genre.all
    end
    
    def create
      item = Item.new(item.params)
      @item.save
      #後でifを使って登録成功時と失敗時にリダイレクト先を分ける
      redirect_to '/'
    end
    
    def index
      @items = Item.all
    end
    
    def show
      @item  = Item.find(params[:id])
      @image = @item.image.page(params[:id]).reverse_order
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    def item_params
      params.require(:item).permit(:id, :image, :name, :explanation, :prace, :genre_id, :sold_out,)
    end
end
