module ReservationsHelper
  def cache_key_for_reservation_row(reservation)
    "reservation-#{reservation.id}-#{reservation.updated_at}"
  end
end
