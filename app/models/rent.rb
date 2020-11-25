class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :device
  validates :date_begin, :date_end, presence: true
end
