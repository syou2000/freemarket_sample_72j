class Item < ApplicationRecord
  has_many :comments
  has_many :messages
  has_many :item_images
  belongs_to :category
  belongs_to :user
  belongs_to :brand
  has_one :late

  def items_images
    return ItemsImage.find_by(item_id: self.id)
  end

  def user
    return User.find_by(id: self.user_id)
  end

  # def profiles
  #   return Profile.find_by(user_id: self.id)
  # end
end
