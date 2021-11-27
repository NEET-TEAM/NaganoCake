class Customer::AddressesController < ApplicationController

before_action :authenticate_customer!
  
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      redirect_to customer_addresses_path, notice: "新しい配送先が登録されました"
    else
      redirect_to customer_addresses_path, alert: "配送先の登録に失敗しました"
    end
  end

  def edit
    @address = Address.find(params[:id])

  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       redirect_to customer_addresses_path, notice: "配送先の編集が完了しました"
    else
       redirect_to edit_customer_address_path, alert: "配送先の編集に失敗しました"
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
