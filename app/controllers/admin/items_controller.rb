class Admin::ItemsController < ApplicationController
  
    before_action :authenticate_admin!
    
    def new
      @item = Item.new
      @genres = Genre.all
    end

    def create
      @item = Item.new(item_params)
      if @item.save
      #後でifを使って登録成功時と失敗時にリダイレクト先を分ける
         redirect_to admin_item_path(@item), notice: "新しい商品が登録されました"
      else
        flash.now[:alert] = '商品の新規登録に失敗しました。'
        render "new"
      end
    end

    def index
      @items = Item.all
    end

    def show
      @item  = Item.find(params[:id])
      @image = @item.image
    end

    def edit
      @item = Item.find(params[:id])
    end

    def update
      @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to admin_item_path(@item)
      else
        render "edit"
      end
    end

    def destroy
      @item.destroy
      redirect_to item_path
    end

    private
    def item_params
      params.require(:item).permit(:image, :name, :explanation, :price, :genre_id, :sold_out)
    end
end
