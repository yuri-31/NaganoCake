class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.order(created_at: :desc) 
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details
    
    if @order.order_status == Order.order_statuses.key(1)
      @order.order_details.update_all(production_status: OrderDetail.production_statuses[:before_production])
    end
    
    redirect_to admin_order_path(params[:id])
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
