class Order < ApplicationRecord
    
    belongs_to :customer, optional: true
    has_many :order_details
    
    enum payment_method: {credit_card: 0, transfer: 1}
    enum order_status: {not_paid: 0, paid: 1, in_production: 2, before_delivery: 3, delivered: 4 }
    
    
    def get_items_total
        (total_price-shipping_fee).round.to_s(:delimited)
    end
end
