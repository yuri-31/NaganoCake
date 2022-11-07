class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all.order(created_at: :desc) 
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_top_path
    else
      render :show
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
