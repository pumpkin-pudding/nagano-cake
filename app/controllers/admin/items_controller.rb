class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
    @genre = Genre.new
  end
  
def create
  @item_new = Item.new(item_params)
  if @item_new.save
    @item = @item_new 
    @items = Item.all.page(params[:page]).per(8)
    flash[:success] = '商品を登録しました'
    redirect_to admin_item_path(@item)
  else
    flash[:danger] = '必要情報を入力してください'
    redirect_to admin_items_path
  end 
end

  private
  def item_params
    params.require(:item).permit(:image, :text, :non_taxed_price, :genre_id, :name, :is_active)
  end

end


