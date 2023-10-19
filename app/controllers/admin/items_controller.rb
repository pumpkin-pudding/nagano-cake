class Admin::ItemsController < ApplicationController
 def show
  @item = Item.find(params[:id]) 
 end
 
 def edit
  @item = Item.find(params[:id])
 end
 
 private
 def item_params
  params.require(:item).permit(:genre_id, :name, :text, :non_taxed_price, :is_active)
 end 
end
