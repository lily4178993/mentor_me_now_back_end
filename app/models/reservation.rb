class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :mentor

  validates :start_time, :end_time, :date, presence: true

  # Custom method to format the start and end times
  def formatted_times
    {
      start_time: start_time.strftime('%H:%M'),
      end_time: end_time.strftime('%H:%M')
    }
  end
end
