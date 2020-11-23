class Rent < ApplicationRecord
  belongs_to :customer
  belongs_to :device
end
