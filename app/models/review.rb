class Review < ApplicationRecord
  belongs_to :listing, foreign_key: 'listing_id'
  belongs_to :user, foreign_key: 'author_id'

  validates :listing, presence: true
  validates :user, presence: true
  validates :rating, presence: true
  validates :rating, numericality:
  {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
end
