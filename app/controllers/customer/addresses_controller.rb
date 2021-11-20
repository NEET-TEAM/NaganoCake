class Customer::AddressesController < ApplicationController
    
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def new
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      redirect_to addresses_path
    else
      redirect_to items_path
    end
  end
  
  def edit
    @address = Address.find(params[:id])
    
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       redirect_to addresses_path
    else
       redirect_to edit_address_path
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:address, :name, :postal_code)
  end
    
end
