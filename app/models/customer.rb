class Customer < ApplicationRecord
  has_many :devices
  has_many :rents
end
