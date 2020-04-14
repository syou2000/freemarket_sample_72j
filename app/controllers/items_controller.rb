class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    Item.create(item_params)
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy

  end

  def edit 

  end

  

  def purchase
    @item = Item.find(params[:id])
  end
  private
  def item_params
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category, :prefecture, :shipping_date, :item_status, item_images_attributes: [:image, :_destroy, :id])
    # .merge(user_id: current_user.id) これをparamsの末尾につける
  end

end
