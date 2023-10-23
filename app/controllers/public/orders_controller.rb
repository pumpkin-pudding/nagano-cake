class Public::OrdersController < ApplicationController
 def index
   @order = Order.where(customer_id: current_customer).reverse_order
   @orders = @order.all
 end

 def confirm
   if params[:order]
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @cart_items = current_customer.cart_items
   @total_amount = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
   @order.postage = 800
   @oreder_total_amount = @total_amount + @order.postage.to_i

   if params[:order][:select_address] == "0"
      @order.shipping_post_code = current_customer.post_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
   elsif params[:order][:select_address] == "1"
      if ShippingAddress.exists?(id: params[:order][:address_id])
        @address = ShippingAddress.find(params[:order][:address_id])
        @order.shipping_name = @address.name
        @order.shipping_post_code = @address.postal_code
        @order.shipping_address = @address.address
      else
        flash[:notice] = "配送先情報がありません"
        render 'new'
      end
   elsif params[:order][:select_address] == "2"
      @order.shipping_name = params[:order][:shipping_name]
      @order.shipping_post_code = params[:order][:shipping_post_code]
      @order.shipping_address = params[:order][:shipping_address]
   else
      render 'new'
   end
      @address = "〒" + @order.shipping_post_code + @order.shipping_address
      session[:order] = @order.attributes
   end

   if session[:order]
    @order = Order.new(session[:order])
    @cart_items = current_customer.cart_items
    @total_amount = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.postage = 800
    @order_total_amount = @total_amount + @order.postage.to_i
    @address = "〒" + @order.shipping_post_code + @order.shipping_address
   else
    @order = Order.new
   end


 end
end