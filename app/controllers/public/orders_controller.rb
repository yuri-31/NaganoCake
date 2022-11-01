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
    # @order.order_status
    
    @cart_items = CartItem.find_by(customer_id: params[:current_customer.id])
    # @cart_items = current_customer.cart_items.all
    
    @items_total = 0
    
    
    @order_detail = OrderDetail.new
  end
  
  def complete
  end

  def index
  end

  def show
  end
  
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :delivery_postal_code, :delivery_address, :delivery_name)
  end
end
