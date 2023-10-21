class Public::CustomersController < ApplicationController
  def  index
  end

  def show
    @customer = current_user
  end

  def  edit
    @customer = current_user
  end
end
