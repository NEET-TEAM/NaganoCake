class AddressesController < ApplicationController
    
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer_id
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
  end
  
  def destroy
    @address = @Address.find(params[:id])
    @address.destroy
  end
  
  private
  
  def address_params
    params.require(:address).permit(:customer_id, :address, :name, :postal_code)
  end
    
end
