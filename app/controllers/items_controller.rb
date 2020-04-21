class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy, :edit, :update, :purchase]

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
    @items = Item.includes(:item_images).order(created_at: :desc)
    @images = ItemImage.order(created_at: :desc)
    @buyer_item = Buyer.pluck(:item_id)
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def edit 
    # @item = Item.find(params[:id])
    # @image = ItemImage.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


 
  def purchase
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category, :prefecture_id, :shipping_date, :item_status, :buyer_id, :image, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).premit(:buyer_id, :exhibitor_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
