class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :chef_id
      t.string :location

      t.timestamps
    end
  end
end
