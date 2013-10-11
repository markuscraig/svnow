class Team < ActiveRecord::Base
	has_many :team_venues
	has_many :venues, through: :team_venues

	has_many :team_apps
	has_many :apps, through: :team_apps

	validates :name, presence: true
end
