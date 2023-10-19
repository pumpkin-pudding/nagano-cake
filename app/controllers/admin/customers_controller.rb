class Admin::CustomersController < ApplicationController

def edit
  @customer = Customer.find(params[:id])
end

def update
  @customer = Customer.find(params[:id])
  @custmer.update(custmer_params)
  redirect_to '/admin/customers'
end

private

end
