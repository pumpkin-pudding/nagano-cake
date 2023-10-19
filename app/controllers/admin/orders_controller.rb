class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(pramas[:id])
    @order_items = @order.order_items
  end
end
