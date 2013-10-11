class CreateTeamVenues < ActiveRecord::Migration
  def change
    create_table :team_venues do |t|
      t.integer :team_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
