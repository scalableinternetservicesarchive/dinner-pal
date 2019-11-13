class Listing < ApplicationRecord
  belongs_to :user, foreign_key: 'chef_id'
  has_many :reservations, foreign_key: 'listing_id'
  after_initialize :set_default_availability, :if => :new_record?

  include PgSearch::Model
  pg_search_scope :search_for, against: %i(title description)

  def set_default_availability
    self[:reserved?] ||= false
  end
end
