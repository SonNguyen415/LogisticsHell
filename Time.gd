extends Node

# Autoloaded Script


var ticks_in_hour = 1 setget set_speed
var seconds_per_tick = 1

func set_speed(ticks_per_hour):
	self.ticks_in_hour = ticks_per_hour
