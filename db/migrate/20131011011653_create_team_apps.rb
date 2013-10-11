class CreateTeamApps < ActiveRecord::Migration
  def change
    create_table :team_apps do |t|
      t.integer :team_id
      t.integer :app_id

      t.timestamps
    end
  end
end
