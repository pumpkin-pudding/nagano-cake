class Admin::OrdersController < ApplicationController

def index
 @orders = Order.all
end

def show
 @order = Order.find(params[:id])
 @order_items = @order.order_details
end

def thanks
end

def update
  @order = Order.find(params[:id])
  @order.update(order_params)
  @order_details = @order.order_details
  redirect_to admin_order_path
end

def order_params
 params.require(:order).permit(:creating_status)
end

end
