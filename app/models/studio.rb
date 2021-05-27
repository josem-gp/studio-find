class Studio < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :name, presence: true
  validates :location, presence: true
  validates :rate, presence: true
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :location ],
    associated_against: {
      user: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
