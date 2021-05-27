class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :studios, dependent: :destroy
  has_many :bookings_as_owner, through: :studios, source: :bookings
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :name, presence: true

  def owner?
    user.studio.any?
  end
end
