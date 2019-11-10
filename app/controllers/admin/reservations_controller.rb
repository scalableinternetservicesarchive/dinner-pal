class Admin::ReservationsController < Admin::BaseController

  def index
    @reservations = Reservation.all
  end

end