class Order < ApplicationRecord
    
    belongs_to :customer, optional: true
    has_many :order_details
    
    
    def get_items_total
        (total_price-shipping_fee).round.to_s(:delimited)
    end
end
