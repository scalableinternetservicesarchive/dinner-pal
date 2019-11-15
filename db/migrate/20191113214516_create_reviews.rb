class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :author_id
      t.integer :listing_id
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
