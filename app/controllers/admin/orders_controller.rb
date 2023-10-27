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
  order = Order.find(params[:id])
  order.update(order_params)
  order = Order.find(params[:id])
  # 注文ステータス[入金確認]=>制作ステータス[製作待ち]
  if order.status == "入金確認"
   order.order_details.each do |order_detail|
    order_detail.update(creating_status: "製作待ち")
   end
  redirect_to admin_order_path
end
end

def order_params
 params.require(:order).permit(:status)
end

end
