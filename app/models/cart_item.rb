class CartItem < ApplicationRecord
    
    belongs_to :item
    
    validates :item_id, presence: true
    validates :customer_id, presence: true
    validates :amount, presence: true
    
    
    # COULD BE SHORTER?
    def get_sub_total_price(price)
        (amount * (price*1.1)).round
    end
end
