class Event < ActiveRecord::Base
	has_many :event_segments
	belongs_to :venue
end
