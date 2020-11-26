class Device < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, presence: true
  has_many :rents, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [[:name, 'A' ], [:description, 'B' ]],
  associated_against: {
    user: [ :first_name, :last_name, :nickname ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
