class Public::OrdersController < ApplicationController
 def index
		 @orders = current_customer.orders
 end
end
