class Admin::ReservationsController < Admin::BaseController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def edit
    @read_only_fields = Set[:id]
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to admin_reservation_path(@reservation), notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to admin_reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      schema = Reservation.column_names.map &:to_sym
      params.require(:reservation).permit(schema)
    end
end