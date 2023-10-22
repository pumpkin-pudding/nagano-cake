class Public::OrdersController < ApplicationController
 
 def show
  @order = Order.find(params[:id])
  @order_details = OrderDtail.where(order_id: @order.id)
 end 
 
 def thanks
 end
  def index
  end

  def new
  end

end
