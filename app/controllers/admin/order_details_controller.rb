class Admin::OrderDetailsController < ApplicationController
    
    def update
        order_detail = OrderDetail.find(params[:id])
        if order_detail.update(order_detail_params)
        # @order = Order.find(params[:order_detail][:order_id])
        # @order_details = @order.order_details.all
        # order_detail = OrderDetail.find(params[:id])
        # order_detail.update(order_detail_params)
        redirect_to admin_top_path
        end
    end
    
    private
    def order_detail_params
        params.require(:order_detail).permit(:production_status)
    end
end
