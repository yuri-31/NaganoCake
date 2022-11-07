class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all.order(created_at: :desc) 
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details.all
    
    if @order.order_status == Order.order_statuses[:paid]
      # @order.order_details.update_all(production_status: OrderDetail.production_statuses[:before_production])
      @order_details.each do |order_detail|
        order_detail.production_status = OrderDetail.production_statuses[:before_production]
        order_detail.save
      end
    end
    
    redirect_to admin_top_path
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
