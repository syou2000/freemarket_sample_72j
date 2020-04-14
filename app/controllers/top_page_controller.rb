class TopPageController < ApplicationController
  def index
    @items = Item.order(created_at: :desc)
    @item = Item.find(params[:id])
    # @item = Item.find_by(id: params[:id])
    @brands = Brand.all.order(created_at: :desc)
  end

end
