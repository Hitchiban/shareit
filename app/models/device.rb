class Device < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :name, :description, :price, presence: true
  has_many :rents, dependent: :destroy
  has_many_attached :photos

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
