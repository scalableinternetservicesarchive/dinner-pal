class Listing < ApplicationRecord
  belongs_to :user, foreign_key: 'chef_id'
  has_many :reservations, foreign_key: 'listing_id'

  include PgSearch::Model
  pg_search_scope :search_for, against: %i(title description)
end
