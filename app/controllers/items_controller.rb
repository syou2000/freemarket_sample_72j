class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy, :purchase]

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      flash.now[:alert] = '入力に誤りがあります'
      render :new
      
    end
  end

  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def edit 

  end

  def purchase
    # @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category, :prefecture_id, :shipping_date, :item_status, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).premit(:buyer_id, :exhibitor_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
