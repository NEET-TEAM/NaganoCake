class Admin::CustomersController < ApplicationController

    before_action :authenticate_admin!
    before_action :admin_customer, only: :withdraw
    

  def index
    @customers = Customer.page(params[:page]).reverse_order.per(5)
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
      redirect_to admin_customer_path, notice: "内容を変更しました"
    else
      redirect_to edit_admin_customer_path(@customer)
    end
  end

  def withdraw
    @customer = Customer.find(params[:id])
    #statusのみをtrueにアップデート
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to admin_customer_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end


end