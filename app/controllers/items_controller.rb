class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.item_images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
    # binding.pry
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # ここでfind_byを使うことでレディーしか取れてなかった
    @category_children = Category.find(params[:parent_id]).children
  end
  
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
    # binding.pry
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to root_path 
    else
      flash.now[:alert] = '入力に誤りがあります'
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
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
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category_id, :prefecture_id, :shipping_date, :item_status, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  # def set_ancestry
  #   @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  # end

  def user_params
    params.require(:user).premit(:buyer_id, :exhibitor_id)
  end
end
