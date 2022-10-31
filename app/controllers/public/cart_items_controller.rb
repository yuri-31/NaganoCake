class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    # @cart_item = CartItem.find(cart_item_params[:id])
    @total = 0
    # @items = Item.find(@cart_items[:item_id])
  end
  
  def create
    @item = Item.find(cart_item_params[:item_id])
     if CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save
       redirect_to cart_items_path
     else
       @cart_item = CartItem.new(cart_item_params)
       @cart_item.customer_id = current_customer.id
       @cart_item.save
      redirect_to cart_items_path
     end
  end
  
  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end

