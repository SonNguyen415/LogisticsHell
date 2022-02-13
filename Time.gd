extends Node

# Autoloaded Script


var ticks_in_hour = 1 setget set_speed
var seconds_per_tick = 1

var current_date = [999, 41, 1] #Year, Date, Hour

var hours_in_day = 24
var days_in_year = 300
var summary_delta = 0
func set_speed(ticks_per_hour):
	self.ticks_in_hour = ticks_per_hour

func _process(delta):
	# Adds an hour to current date every ticks_in_hour seconds
	summary_delta += delta
	while summary_delta >= ticks_in_hour:
		summary_delta -= ticks_in_hour
		add_hour()

func add_hour():
	current_date[2] += 1
	while current_date[2] >= hours_in_day:
		current_date[2] -= (hours_in_day - 1)
		current_date[1] += 1
		if current_date[1] >= days_in_year:
			current_date[1] -= (days_in_year-1)
			current_date[0] += 1
