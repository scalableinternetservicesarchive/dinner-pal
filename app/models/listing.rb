class Listing < ApplicationRecord
  belongs_to :user, foreign_key: 'chef_id'
  has_many :reservations, foreign_key: 'listing_id'
end
