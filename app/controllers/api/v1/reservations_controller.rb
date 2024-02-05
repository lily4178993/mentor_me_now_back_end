class Api::V1::ReservationsController < ApplicationController
  # GET /api/v1/reservations
  # Action to list all reservations
  def index
    reservations = Reservation.all
    render json: reservations
  end

  # POST /api/v1/reservations
  # Action to create a new reservation
  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: reservation, status: :created
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  private

  # Private method to whitelist reservation parameters
  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :date, :user_id, :mentor_id)
  end
end
