class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
  end

  def show
  @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
    @genre = Genre.new

  end

end
