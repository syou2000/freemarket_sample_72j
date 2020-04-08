class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :zip_code,        presence: true
  validates :phone_number,    uniqueness: true


end
