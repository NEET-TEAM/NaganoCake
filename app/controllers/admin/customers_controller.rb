class CustomersController < ApplicationController

  def index
    @customer = Customer.find(params[:id])
    @customers = Customer.paginate(page: params[:page], per_page: 10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_adomin_path
    else
      render "edit"
    end
  end

  def withdraw
    @customer = Customer.find(params[:id])
    #statusのみをtrueにアップデート
    @customer.update(status: true)
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end


end
