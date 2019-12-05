class AddQueryIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :listings, :chef_id
    add_index :reservations, :listing_id
    add_index :reservations, :diner_id
    add_index :reviews, :listing_id
  end
end
