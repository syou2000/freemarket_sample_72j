class ItemsController < ApplicationController

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

  def destroy
  end

  def sample_show
  end

  def sample_show2
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category, :prefecture, :shipping_date, :item_status, item_images_attributes: [:image, :_destroy, :id])
    # .merge(user_id: current_user.id) これをparamsの末尾につける
  end

end
