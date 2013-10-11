class Venue < ActiveRecord::Base
	has_many :team_venues
	has_many :teams, through: :team_venues

	has_many :venue_apps
	has_many :apps, through: :venue_apps

	has_many :events

	validates_presence_of :name, :address, :city, :state,
		:latitude, :longitude, :immediate_radius_ft,
		:near_radius_miles, :far_radius_miles

end
