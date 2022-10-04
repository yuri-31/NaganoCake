class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.find_by(order_id: params[:order][:id])
    @customer = Customer.find_by(customer_id: params[:order][:customer_id])
  end


end
