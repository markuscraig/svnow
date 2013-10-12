# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Define the models that we want to create by default
#

models = [
	{
		team: {
			name: "49ers"
		},
		venue: {
			name: "Candlestick Park",
			address: "100 main st", 
			city: "San Francisco",
			state: "CA", 
			latitude: 37.713956, 
			longitude: -122.385068,
			immediate_radius_ft: 1000, 
			near_radius_miles: 5,
			far_radius_miles: 20			
		},
		app: {
			name: "Cisco SV-NOW",
			developer: "Cisco Sports & Entertainment"			
		},
		app_theme: {
			primary_color: '#FFFFFF', 
			secondary_color: '#FFFFFF', 
			welcome_splash_url: "http://server.com/image.png", 
			video_splash_url: 'http://server.com/image.png', 
			welcome_text: "Howdy Everybody!"			
		},
		events: [
			{
				name: "Arizona Cardinals at San Francisco 49ers", 
				start_time: DateTime.new(2013, 10, 13, 13, 25, 0,'-7')
				#<DateTime: 2001-02-03T04:05:06+07:00 ...>
			},
			{
				name: "New Zealand vs US Womens National Soccer Team", 
				start_time: DateTime.new(2013, 10, 27, 16, 30, 0,'-7')
			},
			{
				name: "Carolina Panthers at San Francisco 49ers", 
				start_time: DateTime.new(2013, 11, 10, 13, 05, 0,'-7')
			},
			{
				name: "St Louis Rams at San Francisco 49ers", 
				start_time: DateTime.new(2013, 12, 1, 13, 05, 0,'-7')
			},
			{
				name: "Seattle Seahawks at San Francisco 49ers", 
				start_time: DateTime.new(2013, 12, 8, 13, 25, 0,'-7')
			},
			{
				name: "Atlanta Falcons at San Francisco 49ers", 
				start_time: DateTime.new(2013, 12, 23, 17, 40, 0,'-7')
			}
		]
	},

	{
		team: {
			name: "Cowboys"
		},
		venue: {
			name: "AT&T Stadium",
			address: "1 Legends Way", 
			city: "Arlington",
			state: "TX",
			latitude: 32.747868, 
			longitude: -97.094232,
			immediate_radius_ft: 1000, 
			near_radius_miles: 5,
			far_radius_miles: 20			
		},
		app: {
			name: "Cisco SV-NOW",
			developer: "Cisco Sports & Entertainment"			
		},
		app_theme: {
			primary_color: '#FFFFFF', 
			secondary_color: '#FFFFFF', 
			welcome_splash_url: "http://server.com/image.png", 
			video_splash_url: 'http://server.com/image.png', 
			welcome_text: "Howdy Everybody!"			
		},
		events: [
			{
				name: "Rally Day", 
				start_time: DateTime.new(2013, 10, 4, 10, 00, 0,'-7')
				#<DateTime: 2001-02-03T04:05:06+07:00 ...>
			},
			{
				name: "Notre Dame vs Arizona State", 
				start_time: DateTime.new(2013, 10, 5, 18, 30, 0,'-7')
			},
			{
				name: "Denver Broncos vs Dallas Cowboys", 
				start_time: DateTime.new(2013, 10, 6, 15, 25, 0,'-7')
			},
			{
				name: "Rally Day", 
				start_time: DateTime.new(2013, 10, 7, 10, 00, 0,'-7')
			},
			{
				name: "Rally Day", 
				start_time: DateTime.new(2013, 10, 12, 10, 00, 0,'-7')
			},
			{
				name: "Washington Redskins vs Dallas Cowboys", 
				start_time: DateTime.new(2013, 10, 13, 19, 30, 0,'-7')
			},
			{
				name: "Minnesota Vikings vs Dallas Cowboys", 
				start_time: DateTime.new(2013, 11, 3, 12, 0, 0,'-7')
			},
			{
				name: "Oakland Raiders vs Dallas Cowboys", 
				start_time: DateTime.new(2013, 11, 28, 15, 30, 0,'-7')
			}
		]
	}
]

# create each database model
models.each do |m|
	# create each model
	team = Team.create(m[:team])
	venue = Venue.create(m[:venue])
	app = App.create(m[:app])
	theme = AppTheme.create(m[:app_theme])

	# make the model associations
	app.app_theme = theme
	venue.teams << team
	venue.apps << app
	team.apps << app

	puts "M = #{m.inspect}"
	puts "EVENTS = #{m[:events].inspect}"

	# create the venue events
	m[:events].each do |e|
		start_time = e[:start_time]

		# create the next event
		event = Event.create(name: e[:name],
			start_time: start_time,
			end_time: start_time + 4.hours)

		# create the event segments
		segment1 = EventSegment.create(
			name: "Gates Open",
			start_time: start_time,
			end_time: start_time - 1.hour)
		segment2 = EventSegment.create(
			name: "Game Start",
			start_time: start_time,
			end_time: start_time)
		segment3 = EventSegment.create(
			name: "Game Over",
			start_time: start_time,
			end_time: start_time + 3.hours)
		segment4 = EventSegment.create(
			name: "Gates Close",
			start_time: start_time,
			end_time: start_time + 4.hours)

		# associate the event segments with the event
		event.event_segments << segment1
		event.event_segments << segment2
		event.event_segments << segment3
		event.event_segments << segment4

		# associate the event with the venue
		venue.events << event
	end
end
