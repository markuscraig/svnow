class CreateVenueApps < ActiveRecord::Migration
  def change
    create_table :venue_apps do |t|
      t.integer :app_id, null: false
      t.integer :venue_id, null: false

      t.timestamps
    end
  end
end
