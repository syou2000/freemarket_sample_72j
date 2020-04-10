class Item < ApplicationRecord
  # has_many :comments
  # has_many :messages
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # belongs_to :category
  # belongs_to :user
  # belongs_to :brand
  # has_one :late
end
