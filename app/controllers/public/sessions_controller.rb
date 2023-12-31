# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  before_action :customer_state, only: [:create]
  
  # def after_sign_in_path_for(resource)
  #   root_path
  # end 
  
  # def after_sign_out_path_for(resource)
  #   root_path
  # end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
    def customer_state
      @customer = Customer.find_by(email: params[:customer][:email])
      return if !@customer
      if @customer.valid_password?(params[:customer][:password]) && @customer.is_active == false
        flash[:notice] = "退会済みの為、再登録が必要です。"
        redirect_to new_customer_session_path
      end
    end
end