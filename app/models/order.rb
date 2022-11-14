class Order < ApplicationRecord
    
    belongs_to :customer, optional: true
    has_many :order_details
    
    validates :customer_id, presence: true
    validates :delivery_postal_code, presence: true
    validates :delivery_address, presence: true
    validates :delivery_name, presence: true
    validates :shipping_fee, presence: true
    validates :total_price, presence: true
    validates :payment_method, presence: true
    # validates :order_status, presence: true
    
    
    enum payment_method: {credit_card: 0, transfer: 1}
    enum order_status: {before_paid: 0, paid: 1, in_production: 2, before_delivery: 3, delivered: 4 }
    
    
    def get_items_total
        (total_price-shipping_fee).round.to_s(:delimited)
    end
end
