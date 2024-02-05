class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :mentor

  validates :start_time, :end_time, :date, presence: true
end
