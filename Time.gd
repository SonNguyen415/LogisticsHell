extends Node

# Autoloaded Script


var ticks_in_hour = 1 setget set_speed
var seconds_per_tick = 1

var current_date = [999, 41, 1] #Year, Date, Hour
var summary_delta = 0
func set_speed(ticks_per_hour):
	self.ticks_in_hour = ticks_per_hour

func _process(delta):
	summary_delta += delta
	while summary_delta >= 1:
		summary_delta -= 1
		add_hour()

func add_hour():
	current_date[2] += 1