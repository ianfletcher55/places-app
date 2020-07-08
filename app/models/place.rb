class Place < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :address, presence: true
end
