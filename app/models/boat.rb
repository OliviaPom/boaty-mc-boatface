class Boat < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, presence: true
  validates :category, presence: true
  validates :brand, presence: true
end
