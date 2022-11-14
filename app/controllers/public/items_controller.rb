class Public::ItemsController < ApplicationController
  
  def index
    @genres = Genre.all

    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.where(is_active: true).page(params[:page]).reverse_order.per(8)
      @all_items = @genre.items.where(is_active: true)
    else
      # redirect_to root_path
      @items = Item.where(is_active: true).page(params[:page]).reverse_order.per(8)
      @all_items = Item.where(is_active: true)
    end
    # if 
    
    # @all_items = Item.all
    # @items = Item.page(params[:page]).reverse_order.per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    # @cart_item.item_id = @item.id
    # @cart_item.customer_id = current_customer.id
  end
end
