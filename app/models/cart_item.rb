class CartItem < ApplicationRecord
    
  belongs_to :customer
  belongs_to :item
  
  validates :item_id, presence: true
  
end
