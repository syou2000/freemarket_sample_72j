class Address < ApplicationRecord
  belongs_to :user, optional: true

  VALID_PHONE_REGEX = /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/
  validates :zip_code,        presence: true
  validates :phone_number,    presence: true,  format: { with: VALID_PHONE_REGEX }


end
