class User < ApplicationRecord
  has_many :boats
  has_many :bookings
  has_many :boats_bookings, through: :boats, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
