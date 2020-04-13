class Item < ApplicationRecord
  # has_many :comments
  # has_many :messages
  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :categories
  # belongs_to :user
  has_many :brands
  # has_one :late
end
