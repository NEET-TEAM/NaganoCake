class Customer < ApplicationRecord
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def inactive_message
    "退会済みのアカウントです"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  has_many :orders, dependent: :destroy
  
  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end



  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナで 入力してください"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/,message: "は全角カタカナで 入力してください"}
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true


end
