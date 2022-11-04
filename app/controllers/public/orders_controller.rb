class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
# NOT SURE
    elsif params[:order][:select_address] == "2"
      @order.delivery_postal_code = params[:order][:delivery_postal_code]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name = params[:order][:delivery_name]
    end
    
    @cart_items = current_customer.cart_items.all
    @items_total = 0
    @order.shipping_fee = 800
    # binding.pry
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment_method]
    @order.delivery_postal_code = params[:order][:delivery_postal_code]
    @order.delivery_address = params[:order][:delivery_address]
    @order.delivery_name = params[:order][:delivery_name]
    @order.shipping_fee = 800
    @order.order_status = Order.order_statuses[:not_paid]
    @order.save
  
    @cart_items = current_customer.cart_items.all
    
    # @items_total = 0
    
    current_customer.cart_items. each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order.id
      @order_detail.price_on_purchase = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.production_status = OrderDetail.production_statuses[:not_paid]
      @order_detail.save
    end
    
    current_customer.cart_items.destroy_all
    redirect_to order_complete_path
  end
  
  def complete
  end

  def index
  end

  def show
  end
  
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :delivery_postal_code, :delivery_address, :delivery_name, :shipping_fee, :total_price, :order_status)
  end
  
  # def order_detail_params
  #   params.require(:order_detail).permit(:item_id, :order_id, :price_on_purchase, :amount, :production_status)
  # end
end
