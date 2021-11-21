class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page])
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

      redirect_to admin_customer_path

    else
      redirect_to edit_admin_customer_path(@customer)
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
