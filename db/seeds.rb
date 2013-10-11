# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

team = Team.create(name: "San Francisco 49ers")

venue = Venue.create(name: "Candlestick Park",
	address: "100 main st", 
	city: "San Francisco",
	state: "CA", 
	latitude: 37.713956, 
	longitude: -122.385068,
	immediate_radius_ft: 1000, 
	near_radius_miles: 5,
	far_radius_miles: 20)

app = App.create(name: "Cisco SV-NOW",
	developer: "Cisco Sports & Entertainment")

theme = AppTheme.create(primary_color: '#FFFFFF', 
	secondary_color: '#FFFFFF', 
	welcome_splash_url: "http://server.com/image.png", 
	video_splash_url: 'http://server.com/image.png', 
	welcome_text: "Howdy Everybody!")

app.app_theme = theme
venue.teams << team
venue.apps << app
team.apps << app

#
# Create the events
#

events = [
	{
		name: "49ers vs Broncos", 
		start_time: 10.days.from_now, 
		end_time: 11.days.from_now,
		event_segments: [
			{
				name: "Gates Open", 
				start_time: 10.days.from_now, 
				end_time: 11.days.from_now,
			},
			{
				name: "Game Start", 
				start_time: 10.days.from_now, 
				end_time: 11.days.from_now,
			},
			{
				name: "Game End", 
				start_time: 10.days.from_now, 
				end_time: 11.days.from_now,
			},
			{
				name: "Gates Close", 
				start_time: 10.days.from_now, 
				end_time: 11.days.from_now,
			}
		]
	},
	{ name: "49ers vs Seahawks", start_time: 12.days.from_now, end_time: 13.days.from_now }
]

events.each do |e|
	event = Event.create(name: e[:name], start_time: e[:start_time], end_time: e[:end_time])
end