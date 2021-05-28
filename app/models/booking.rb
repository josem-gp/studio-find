class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: [ :pending, :confirmed, :declined ]
end
