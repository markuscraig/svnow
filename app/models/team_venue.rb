class TeamVenue < ActiveRecord::Base
	belongs_to :team
	belongs_to :venue

	validates :team_id, presence: true
	validates :venue_id, presence: true
end
