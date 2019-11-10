class Admin::ListingsController < Admin::BaseController

  def index
    @listings = Listing.all
  end

end