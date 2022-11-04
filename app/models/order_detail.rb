class OrderDetail < ApplicationRecord
    
    belongs_to :order
    belongs_to :item
    
    enum production_status: {not_paid: 0, before_production: 1, in_production: 2, production_complete: 3 }
    
    def get_subtotal
        (price_on_purchase*amount).round.to_s(:delimited)
    end
    
end
