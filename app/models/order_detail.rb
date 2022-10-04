class OrderDetail < ApplicationRecord
    
    belongs_to :order
    
    def get_subtotal
        (price_on_purchase*amount).round.to_s(:delimited)
    end
    
end
