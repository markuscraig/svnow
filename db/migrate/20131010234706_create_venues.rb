class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.integer :immediate_radius_ft, null: false
      t.integer :near_radius_miles, null: false
      t.integer :far_radius_miles, null: false

      t.timestamps
    end
  end
end
