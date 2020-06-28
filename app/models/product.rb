class Product < ApplicationRecord
  validates :name, presence:true, uniqueness: true
  validates :imageUrl, presence: true
  validates :price, presence: true
end
