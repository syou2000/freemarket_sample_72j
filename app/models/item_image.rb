class ItemImage < ApplicationRecord
  mount_uploader :item_images, Item_imagesUploader
end
