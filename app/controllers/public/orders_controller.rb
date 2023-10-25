class Public::OrdersController < ApplicationController
 
 def show
  @order = Order.find(params[:id])
  @order_details = OrderDtail.where(order_id: @order.id)
 end 
 
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end
  


 
 def thanks
 end
  def index
  end

  def new
  end

end
