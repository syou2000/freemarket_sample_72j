class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :profile, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :buyeres

  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/
  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :year, :month, :day, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASS_REGEX}

  # profileモデルとuserモデルのアソシエーションはうまくいっている、参考までに残しているが、最後には削除する
  # def profile
  #   return Profile.find_by(user_id: self.id)
  # end

end
