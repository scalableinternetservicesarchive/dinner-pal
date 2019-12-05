module ListingsHelper
  def cache_key_for_listing_row(listing)
    "listing-#{listing.id}-#{listing.updated_at}-#{listing.images.count}"
  end

  def cache_key_for_listing_review_row(review)
  	"listing-review-#{review.id}-#{review.updated_at}"
  end

  def cache_key_for_listing_table_browse
  	"listing-table-#{Listing.maximum(:updated_at)}"
  end

  def cache_key_for_listing_table_reserved
  	max_reserved_updated_at = @reserved_listings.max_by(&:updated_at).updated_at
  	"listing-table-#{max_reserved_updated_at}"
  end

  def cache_key_for_listing_table_available
  	max_available_updated_at = @available_listings.max_by(&:updated_at).updated_at
  	"listing-table-#{max_available_updated_at}"
  end

  def cache_key_for_listing_review_table
  	if @reviews.length > 0
  		max_review_updated_at = @reviews.max_by(&:updated_at).updated_at
  	end
  	"listing-review-table-#{@listing.id}-#{@listing.updated_at}-#{@listing.images.count}-#{max_review_updated_at}"
  end
end
