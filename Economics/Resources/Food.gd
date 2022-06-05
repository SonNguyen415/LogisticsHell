extends Node

"""
Food Code
- Max
"""

var produced_food = []
var total_food = 0
var expire_rate = 0 # Months until food expires

func produce_food(count):
	# Produce count amount of food, and stores value in array
	# count: [nteger, expiration month count]
	produced_food.append([count, expire_rate])
	total_food += count

func get_to_expire_food():
	# Gets the amount of food that will expire next month
	var count = 0
	for i in len(produced_food):
		if produced_food[i][1] <= 1:
			count += produced_food[i][0]
	
	return count
		
func expire_round():
	# Reduces the time to expire for each food in produced_food by 1
	# Then removes those that hit 0
	var remove_indices = []
	for i in len(produced_food):
		produced_food[i][1] -= 1
		if produced_food[i][1] <= 0:
			remove_indices.push_back(i)
	
	for index in remove_indices:
		produced_food.remove(index) # We remove from the back so no index black magic fuckery
			

func time_cycle():
	#TODO: One month passes, then call this
	produce_food(0) # Later when determining code for monthly food production, we put that here
	expire_round()
