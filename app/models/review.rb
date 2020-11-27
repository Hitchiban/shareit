class Review < ApplicationRecord
  belongs_to :device
  validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
  validates :content, presence: true
  validates :title, presence: true
end
