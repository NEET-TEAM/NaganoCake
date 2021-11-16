class ItemsController < ApplicationController
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item.params)
        @item.save
    end
    
    def index
    end
    
    def show
    end
    
    def edit
    end
    
    def uodate
    end
    
    private
    
end
