class Item < ApplicationRecord
    
    has_many :cart_items, dependent: :destroy
    has_many :oders
    has_many :oder_histries, dependent: :destroy
    belongs_to :genre
    attachment :image
    
    validates :name, presence: true


  def add_tax_price
    (self.price * 1.1).round
  end

    
end
