class Customer::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      redirect_to customer_addresses_path
    else
      redirect_to customer_items_path
    end
  end
  
  def edit
    @address = Address.find(params[:id])
    
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       redirect_to customer_addresses_path
    else
       redirect_to edit_customer_address_path
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to customer_addresses_path
  end
  
  private
  
  def address_params
    params.require(:address).permit(:address, :name, :postal_code)
  end
    
end
