"""
---------------------------------------------------------------------------------------------------

The time system of the game
Stores the rate at which an hour goes, how many hours per day, month, year... 
Also configurable

Authors: Max Kim

---------------------------------------------------------------------------------------------------
"""


extends Node

# Autoloaded Script

# Number of seconds in 1 game hour
var ticks_in_hour = 1 setget set_speed

# Date
var current_date = [999, 41, 1] #Year, Date, Hour

# Some constants for this fictional date
const hours_in_day = 24
const days_in_year = 300

# Stores current seconds
var summary_delta = 0

signal tick_generated()


func set_speed(ticks_per_hour):
	# Sets the game speed (ticks/seconds per hour)
	ticks_in_hour = ticks_per_hour

func _process(delta):
	# Adds an hour to current date every ticks_in_hour seconds
	summary_delta += delta
	while summary_delta >= ticks_in_hour:
		summary_delta -= ticks_in_hour
		add_hour()
		emit_signal("tick_generated")

func add_hour():
	# Increases the number of hours in current_date by 1
	# Also makes the appropriate changes to date and year
	current_date[2] += 1
	while current_date[2] >= hours_in_day:
		current_date[2] -= (hours_in_day - 1)
		current_date[1] += 1
		if current_date[1] >= days_in_year:
			current_date[1] -= (days_in_year-1)
			current_date[0] += 1
