class Admin::ItemsController < ApplicationController
<<<<<<< HEAD
  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
    @genre = Genre.new
  end

=======
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
>>>>>>> origin/develop
end
