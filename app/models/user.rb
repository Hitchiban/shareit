class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :devices, dependent: :destroy
  has_many :rents
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :nickname, uniqueness: true
end
