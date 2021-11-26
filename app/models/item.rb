class Item < ApplicationRecord
    
    has_many :cart_items, dependent: :destroy
    has_many :oders
    has_many :oder_histries, dependent: :destroy
    belongs_to :genre
 
    
    


  def add_tax_price
    (self.price * 1.1).round
  end
  
  attachment :image
  
  validates :name, presence: true
  validates :image_id, presence: true
  validates :genre_id, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
    
end
