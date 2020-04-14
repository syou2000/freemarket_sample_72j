class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :brand
  has_one :buyer

  def item_image
    return ItemsImage.find_by(item_id: self.id)
  end

  # itemモデルとuserモデルのアソシエーションはうまくいっている、参考までに残しているが、最後には削除する
  # def user
  #   return User.find_by(id: self.user_id)
  # end

end
