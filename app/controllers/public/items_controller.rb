class Public::ItemsController < ApplicationController
  def index
  end

  def show
  @item = Item.find(params[:id])
  @genres = Genre.all
  @cart_item = CartItem.new
  end

def create
  @cart_product = CartItem.new
  @cart_items.save
  redirect_to cart_items_path
 end

end
