class Brand < ApplicationRecord
  has_many :items

  def items
    return Item.find_by(brand_id: self.id)
  end
end
