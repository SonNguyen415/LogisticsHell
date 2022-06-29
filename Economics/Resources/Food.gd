extends Resources
class_name Food

"""
Food Code
- Max
"""

var produce_array # Stores count of food and their expire date
# We simply use up whatever expires soonest for now
var expire_rate = 0 # Months until food expires

func set_value(val):
	.set_value(val) # Parent Call
	produce_array = [[val, expire_rate]]

func add_value(val):
	.add_value(val)
	produce_array.append([val, expire_rate])

func subtract_value(val):
	pass #I'll implement this in a bit

func get_expire_food():
	# Gets the amount of food that will expire next month
	var count = 0
	for i in len(produce_array):
		if produce_array[i][1] <= 1:
			count += produce_array[i][0]
	return count
		
func produce():
	# Reduces the time to expire for each food in produced_food by 1
	# Then removes those that hit 0
	# Then produces 1 month worth of food again
	var remove_indices = []
	for i in len(produce_array):
		produce_array[i][1] -= 1
		if produce_array[i][1] <= 0:
			remove_indices.push_back(i)
	for index in remove_indices:
		add_value(-produce_array[index][0]) # Food remaining to be reduced
		produce_array.remove(index) # We remove from the back so no index black magic fuckery
	produce_array.append([produce, expire_rate]) # Production
