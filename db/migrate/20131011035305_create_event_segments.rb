class CreateEventSegments < ActiveRecord::Migration
  def change
    create_table :event_segments do |t|
      t.string :name, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
  end
end
