class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :location, presence: true
  validates :category, presence: true
  validates :brand, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

# Boat.create!(name:"hello", price: 55, location: "Ibiza", category: "yacht", brand: "mercedes")
