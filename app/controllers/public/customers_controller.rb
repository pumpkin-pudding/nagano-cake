class Public::CustomersController < ApplicationController
  def  index
  end

  def show
    current_customer = Customer.find(1)
    @customer = current_customer
  end

  def  edit
    current_customer = Customer.find(1)
    @customer = current_customer
  end

  def update
    current_customer = Customer.find(1)
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_information_path
  end

  def check
    current_customer = Customer.find(1)
    @customer = current_customer
  end


private

def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email)
end

  def check
  end
end
