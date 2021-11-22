class Order < ApplicationRecord
  
  enum payment: {credit_card:0,bank_payment:1}
  
  enum order_status: {
        payment_waiting:0,#入金待ち
        payment_confirmation:1,#入金確認
        under_production:2,#制作中
        preparing_to_ship:3,#発送準備中
        shipped:4,}#発送済み
        
  has_many :order_histries,dependent: :destroy
  has_many :items,through: :order_histries,source: :item
  
  
  
  
  belongs_to :customer
  
    
end
