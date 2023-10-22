class Public::OrdersController < ApplicationController
 def index
   @order = Order.where(customer_id: current_customer).reverse_order
   @orders = @order.all
 end
end
