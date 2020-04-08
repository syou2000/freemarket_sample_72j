class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :zip_code,        presence: true


end
