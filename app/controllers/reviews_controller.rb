class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :delete]

  def new
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.author_id = current_user.id

    # check if review author had a reservation with the listing
    unless Reservation.exists?(diner_id: @review.author_id, listing_id: @review.listing_id)
      format.html { redirect_to @review.listing, notice: 'Review failed to create.' }
      format.json { head :no_content, status: :unauthorized }
    end

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

  # GET /reviews/1/edit
  def edit
    @listing_id = @review.listing_id
  end

  # PATCH/PUT /review/1
  # PATCH/PUT /review/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review.listing, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review.listing }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    listing_url = @review.listing
    @review.destroy
    respond_to do |format|
      format.html { redirect_to listing_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize_user
      review = Review.find(params[:id])
      redirect_to root_url, alert: 'You cannot view this page.' review.author_id == current_user.id or current_user.admin?
    end

    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      schema = Review.column_names.map &:to_sym
      params.require(:review).permit(schema)
    end
end
