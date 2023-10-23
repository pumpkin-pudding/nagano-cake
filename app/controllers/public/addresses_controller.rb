class Public::AddressesController < ApplicationController
    
  def index
    @addresses = Address.all
    @address_new = Address.new
  end 
  
  def create
    @address_new = Address.new(address_params)
    @addresses = Address.all
    @address_new.customer_id = current_customer.id
    if @address_new.save
     flash[:success] = '配送先を登録しました'
     redirect_to addresses_path
    else
     flash[:danger] = '必要情報を入力してください/ハイフンは使用できません'
     redirect_to addresses_path
    end 
  end 
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    flash[:success] = '削除しました'
    redirect_to addresses_path
  end 
  
  def edit
    @addresses = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
       flash[:success] = "配送先の変更内容を保存しました。"
       redirect_to addresses_path
    else
       flash[:danger] = "配送先の変更内容に不備があります。"
       redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def address_params
    params.require(:address).permit(:address, :zip_code, :name)
  end 
     
end
