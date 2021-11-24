class Order < ApplicationRecord

  enum payment: {クレジットカード:0,銀行振込:1}

  enum order_status: {
        入金待ち:0,#入金待ち
        入金確認:1,#入金確認
        制作中:2,#制作中
        発送準備中:3,#発送準備中
        発送済み:4,}#発送済み

  has_many :order_histries,dependent: :destroy
  has_many :items,through: :order_histries,source: :item


  belongs_to :customer

  def full_name
    self.customer.last_name + " " + self.customer.first_name
  end

  def full_name_kana
   self.customer.last_name_kana + " " + self.customer.first_name_kana
  end


end
