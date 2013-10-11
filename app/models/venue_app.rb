class VenueApp < ActiveRecord::Base
	belongs_to :venue
	belongs_to :app
end
