class Device < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, presence: true
  has_many :rents
end
