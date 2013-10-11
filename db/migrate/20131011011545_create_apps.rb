class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.string :developer, null: false
      t.string :app_key, null: false

      t.timestamps
    end
  end
end
