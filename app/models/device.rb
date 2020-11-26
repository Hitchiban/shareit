class Device < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, presence: true
  has_many :rents, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
end
