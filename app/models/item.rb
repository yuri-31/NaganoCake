class Item < ApplicationRecord
    belongs_to :genre, optional: true
    has_many :cart_items
    
    has_one_attached :item_image
    
    validates :item_image, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :genre_id, presence: true
    validates :price, presence: true
    # validates :is_active, presence: true
    
    # FAILED WHEN PUDDING.JPEG WAS PROCESSED
    def get_item_image(width, height)
        item_image.variant(resize_to_limit: [width, height]).processed
    end
    
    # NOT SURE
    def add_tax_price
        (price*1.1).round.to_s(:delimited)
    end
    
    # NOT SURE
    def before_tax_price
        price.to_s(:delimited)
    end
end
