class AddReservedToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :reserved?, :boolean
    add_index :listings, :reserved?
  end
end
