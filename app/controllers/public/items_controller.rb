class Public::ItemsController < ApplicationController
  def index
  end

  def show
  @item = Item.find(params[:id])
  @genres = Genre.all
  end

end
