class ItemsController < ApplicationController

  def new
  end

  def create
    Item.create(item_params)
  end

  def destroy
  end

  def sample_show

  end

  def sample_show2

  end
  # private
  # def item_params
  #   params.permit(:)
  # end

end
