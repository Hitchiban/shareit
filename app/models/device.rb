class Device < ApplicationRecord
  belongs_to :user
  validates :name, :description, :address, :price, presence: true
  has_many :rents, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [[:address, 'A' ], [:name, 'B' ], [:description, 'C' ]],
  associated_against: {
    user: [ :first_name, :last_name, :nickname ]
  },
  using: {
    tsearch: { prefix: true }
  }
end

