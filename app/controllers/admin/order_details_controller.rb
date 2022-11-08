class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    
    def update
        order_detail = OrderDetail.find(params[:id])
        @order = order_detail.order
        @order_details = @order.order_details
        order_detail.update(order_detail_params)
        
        if @order_details.exists?(production_status: OrderDetail.production_statuses[:in_production])
            @order.order_status = Order.order_statuses[:in_production]
            @order.save
        end
        
        if @order_details.count == @order_details.where(production_status: OrderDetail.production_statuses[:production_complete]).count
            @order.order_status = Order.order_statuses[:before_delivery]
            @order.save
        end
        
        redirect_to admin_order_path(order_detail.order.id)
    end
    
    private
    def order_detail_params
        params.require(:order_detail).permit(:production_status)
    end
end
