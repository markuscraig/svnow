class TeamApp < ActiveRecord::Base
	belongs_to :app
	belongs_to :team

	validates :app_id, presence: true
	validates :team_id, presence: true
end
