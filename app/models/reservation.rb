class Reservation < ApplicationRecord
  belongs_to :listing, foreign_key: 'listing_id'
  belongs_to :user, foreign_key: 'diner_id'
end
