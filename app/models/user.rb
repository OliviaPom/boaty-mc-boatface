class User < ApplicationRecord
  has_many :boats
  has_many :bookings
  has_many :boats_bookings, through: :boats, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, presence: true
  validates :lastname, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :password, length: { in: 6..20 }
end
