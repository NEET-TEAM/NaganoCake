class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if current_customer.update(customer_params)
      redirect_to customer_path, notice: "内容を変更しました"
    else
      render "edit"
    end
  end


  def withdraw
    #statusのみをtrueにアップデート
    current_customer.update(status: true)
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end
