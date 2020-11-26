class Device < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, presence: true
  has_many :rents, dependent: :destroy
  has_many_attached :photos
<<<<<<< HEAD
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

=======
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
>>>>>>> 6a132d0e943c5461409c9344fe6ba53d7bc05623
end

