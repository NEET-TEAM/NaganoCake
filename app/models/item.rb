class Item < ApplicationRecord
    
    has_many :cart_items
    has_many :oders
    belongs_to :genre
    attachment :image
    
    validates :name, presence: true
    varidates :prace, presence: true
    varidates :explanation, presence: true

    
end
