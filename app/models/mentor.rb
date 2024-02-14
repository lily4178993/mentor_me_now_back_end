class Mentor < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, :occupation, :about, :hourly_fee, :year_of_experience, :location, :skills, :photo_url, presence: true
  validates :hourly_fee, numericality: { greater_than_or_equal_to: 0 }
  validates :year_of_experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
