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
      redirect_to customer_path(@customer), notice: "内容を変更しました"
    else
      render "edit"
    end
  end

  def out
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    #statusのみをtrueにアップデート
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end

end