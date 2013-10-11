class App < ActiveRecord::Base
	has_many :team_apps
	has_many :teams, through: :team_apps

	has_many :venue_apps
	has_many :venues, through: :venue_apps

	has_one  :app_theme

	validates_presence_of :name, :developer

	before_create :generate_app_key

	private

	def generate_app_key
		self.app_key = SecureRandom.urlsafe_base64(40, false)
	end

end
