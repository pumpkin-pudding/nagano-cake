class Public::OrdersController < ApplicationController
 def index
   @order = Order.where(customer_id: current_customer).reverse_order
   @orders = @order.all
 end

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

 def confirm
   if params[:order]
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @cart_items = current_customer.cart_items
  # @total_amount = @cart_items.inject(0) { |sum, item| sum + item.amount }
   @order.postage = 800
  # @oreder_total_amount = @total_amount + @order.postage.to_i


   if params[:order][:address_option] == "0"
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
   elsif params[:order][:address_option] == "1"
      if ShippingAddress.exists?(id: params[:order][:address_id])
        @address = Address.find(params[:order][:address_id])
        @order.name = @address.name
        @order.zip_code = @address.zip_code
        @order.address = @address.address
      else
        flash[:notice] = "配送先情報がありません"
        render 'new'
      end
   elsif params[:order][:address_option] == "2"
      @order.name = params[:order][:shipping_name]
      @order.zip_code = params[:order][:zip_code]
      @order.address = params[:order][:address]
   else
      render 'new'
   end
   end
end

   def complete
    render 'thanks'
   end

   def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
   end



   private

  def order_params
   params.require(:order).permit(:shipping_name, :zip_code, :address, :postage, :billing_amount, :payment_method)
  end
end
