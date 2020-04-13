class Item < ApplicationRecord
  # has_many :comments,    dependent: :destroy
  # has_many :messages
  has_many :item_images, dependent: :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :brand
  # has_one :late,         dependent: :delete
  has_one :buyer

  def items_images
    return ItemsImage.find_by(item_id: self.id)
  end

  def user
    return User.find_by(id: self.user_id)
  end

end
