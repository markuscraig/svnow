class AppTheme < ActiveRecord::Base
	belongs_to :app
	
	validates_presence_of :primary_color, :secondary_color,
		:welcome_splash_url, :video_splash_url, :welcome_text

end
