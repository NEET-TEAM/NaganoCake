# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #before_actionでcustomer/sessions_controller の create アクションが実行される前に確認
  before_action :customer_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得　downcaseでで大文字を小文字にすべて変換させて、大文字小文字関係なく、メールアドレス自体が合っていたらok
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別 ＆　active_for_authentication?でcustomerのis_deleatedがfalseかどうか
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
    ## 【処理内容3】 is_deleteがtrueの場合、退会済なのでログイン画面にリダイレクト
      redirect_to new_customer_session_path
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
