class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :category, optional: true
  belongs_to :user
  has_one :buyer

  validates :name,            presence: true
  validates :price,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :explain,         presence: true
  validates :postage,         presence: true
  validates :prefecture_id,   presence: true
  validates :shipping_date,   presence: true
  validates :category_id,     presence: true
  validates :item_status,     presence: true

end
