class User < ApplicationRecord
  has_many :reservations
  has_many :mentors, through: :reservations

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
end
