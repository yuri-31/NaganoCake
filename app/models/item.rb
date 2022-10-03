class Item < ApplicationRecord
    
    has_one_attached :item_image
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    
end
