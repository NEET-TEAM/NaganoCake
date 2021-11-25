class Address < ApplicationRecord
    
    def address_all
      self.postal_code + self.address + self.name
    end

    
    belongs_to :customer
    
    validates :name, presence: true
    validates :address, presence: true
    validates :postal_code, presence: true
end
