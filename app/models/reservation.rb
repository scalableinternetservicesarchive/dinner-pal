class Reservation < ApplicationRecord
  belongs_to :listing, foreign_key: 'listing_id'
  belongs_to :user, foreign_key: 'diner_id'
  after_save :reserve_listing
  before_destroy :free_listing

  def reserve_listing
    self.listing.set_availability(true)
  end

  def free_listing
    self.listing.set_availability(false) if self.listing
  end
end
