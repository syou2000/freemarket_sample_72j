class TopPageController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
    @item = Item.find_by(id: params[:id])
    @brands = Brand.all
  end

end
