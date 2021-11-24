class Address < ApplicationRecord
    
    def address_all
      self.postal_code + self.address + self.name
    end

    
    belongs_to :customer
end
