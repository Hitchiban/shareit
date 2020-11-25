class Device < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :name, :description, :price, presence: true
  has_many :rents, dependent: :destroy
  has_many_attached :photos

end
