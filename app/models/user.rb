class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  has_one :profile
  accepts_nested_attributes_for :profile

  VALID_EMAIL_REGEX = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/

  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana,  presence: true
  validates :email,           presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,        presence: true, length: { minimum: 7 }
  validates :phone_number,    uniqueness: true
  validates :birthday,        presence: true

end
