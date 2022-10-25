class Public::ItemsController < ApplicationController
  
  def index
    @all_items = Item.all
    @items = Item.page(params[:page]).reverse_order.per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    # @cart_item.item_id = @item.id
    # @cart_item.customer_id = current_customer.id
  end
end
