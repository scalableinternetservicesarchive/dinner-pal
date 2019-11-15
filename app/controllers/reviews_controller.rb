class ReviewsController < ApplicationController
  def new
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.author_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review.listing, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review.listing }
      else
        format.html { redirect_to @review.listing, notice: 'Review failed to create.' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_review
      @review = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      schema = Review.column_names.map &:to_sym
      params.require(:review).permit(schema)
    end
end
