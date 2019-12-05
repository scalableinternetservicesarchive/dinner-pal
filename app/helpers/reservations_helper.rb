module ReservationsHelper
  def cache_key_for_reservation_row(reservation)
    "reservation-#{reservation.id}-#{reservation.updated_at}"
  end

  def cache_key_for_reservation_table
  	if @reservations.length > 0
  		max_reservation_updated_at = @reservations.max_by(&:updated_at).updated_at
  	end
  	"listing-table-#{max_reservation_updated_at}"
  end
end
