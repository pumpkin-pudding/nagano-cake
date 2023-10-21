class Admin::ItemsController < ApplicationController
 def index
 end


 def show
  @item = Item.find(params[:id])
  @genre = Genre.find(params[:genre_id])
  @cart_product = CartItem.new
 end

 def edit
  @item = Item.find(params[:id])
 end

 private
 def item_params
  params.require(:item).permit(:genre_id, :name, :text, :non_taxed_price, :is_active, :image)
 end
end
