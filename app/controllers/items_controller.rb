class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    Item.create(item_params)
  end

  def destroy
  end

  def edit 

  end

  def sample_show
    @comments = Comment.all
  end

  def sample_show2

  end
  private
  def item_params
    # params.permit(:)
  end

end
