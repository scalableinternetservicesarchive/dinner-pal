class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  has_many :listings, foreign_key: 'chef_id', dependent: :destroy
  has_many :reservations, foreign_key: 'diner_id', dependent: :destroy

  def available_listings
    listings.where(reserved?: false)
  end

  def reserved_listings
    listings.where(reserved?: true)
  end

  protected
  def confirmation_required?
    false
  end
end
