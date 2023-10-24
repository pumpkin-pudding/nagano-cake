class Admin::OrdersController < ApplicationController

def index
 @orders = Order.all
end

def show
end

def thanks
end

def order_params
 params.require(:order).permit(:status)
end

end
