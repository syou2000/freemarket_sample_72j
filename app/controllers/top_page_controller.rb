class TopPageController < ApplicationController
  def index
    @items = Item.includes(:item_images).order(created_at: :desc)
    @item = Item.find_by(id: params[:id])
    @brands = @items.where(brand: "シャネル").order(created_at: :desc)
    @images = ItemImage.order(created_at: :desc)
    # @buyer = Buyer.find_by(id: params[:id])
    @buyerBrand = Buyer.pluck(:item_id)
    # @buyerBrand = @buyer.item_id
  end
  
def product_buyer
  params.require(:item).permit(:id, :buyer_id)
end

end