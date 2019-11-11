class Admin::ListingsController < Admin::BaseController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def edit
    @read_only_fields = Set[:id]
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to admin_listing_path(@listing), notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to admin_listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      schema = Listing.column_names.map &:to_sym
      params.require(:listing).permit(schema)
    end
end