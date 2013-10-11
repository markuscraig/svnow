class AddEventReferences < ActiveRecord::Migration
  def change
  	add_column :event_segments, :event_id, :integer
  	add_column :events, :venue_id, :integer
  end
end
