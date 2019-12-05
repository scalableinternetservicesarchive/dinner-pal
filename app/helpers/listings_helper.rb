module ListingsHelper
  def cache_key_for_listing_row(listing)
    "listing-#{listing.id}-#{listing.updated_at}"
  end

  def cache_key_for_listing_image_row(image)
  	"listing-image-#{image.id}"
  end

  def cache_key_for_listing_review_row(review)
  	"listing-review-#{review.id}-#{review.updated_at}"
  end
end
