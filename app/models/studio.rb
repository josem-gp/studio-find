class Studio < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :name, presence: true
  validates :location, presence: true
  validates :rate, presence: true
  has_many_attached :photos
end
