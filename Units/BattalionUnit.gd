extends Node2D


class_name BattalionUnit

var maximum_morale = Defines.base_max_morale setget set_maximum_morale, get_maximum_morale
var morale_recovery = Defines.base_morale_recovery setget set_morale_recovery, get_morale_recovery
var morale = maximum_morale setget set_morale, get_morale

var weariness = 0 setget set_weariness, get_weariness
var weariness_increase = Defines.base_weariness_increase setget set_weariness_increase, get_weariness_increase
var weariness_decrease = Defines.base_weariness_decrease setget set_weariness_decrease, get_weariness_decrease

var troop_strength = Defines.MAX_BATTALION_SIZE setget set_troop_strength, get_troop_strength
var wounded = 0 setget set_wounded, get_wounded
var sick = 0 setget set_sick, get_sick
var total_troops = troop_strength setget set_total_troops, get_total_troops

var activity = true setget set_activity, get_activity
var fighting = false setget set_fighting, get_fighting
var resting = false setget set_resting, get_resting

var shock = 5.0 setget set_shock, get_shock
var discipline = 1.0 setget set_discipline, get_discipline
var assault = 1.2 setget set_assault, get_assault
var retaliation = 1.0 setget set_retaliation, get_retaliation
var fortitude = 0.8 setget set_fortitude, get_fortitude
var lethality = 0.3 setget set_lethality, get_lethality

#Stats regarding the actual fight
var random = RandomNumberGenerator.new()
var total_losses = 0 setget set_total_losses, get_total_losses
var total_dead = 0 setget set_total_losses, get_total_losses
var incoming_shock = 0
var total_moral_loss = 0

var troop_type setget set_troop_type, get_troop_type

# Sets and Gets
func set_maximum_morale(value):
	maximum_morale = value

func get_maximum_morale():
	return maximum_morale

func set_morale_recovery(value):
	morale_recovery = value

func get_morale_recovery():
	return morale_recovery

func set_morale(value):
	morale = value

func get_morale():
	return morale

func set_weariness(value):
	weariness = value

func get_weariness():
	return weariness

func set_weariness_increase(value):
	weariness_increase = value

func get_weariness_increase():
	return weariness_increase

func set_weariness_decrease(value):
	weariness_decrease = value

func get_weariness_decrease():
	return weariness_decrease

func set_troop_strength(value):
	troop_strength = value

func get_troop_strength():
	return troop_strength

func set_wounded(value):
	wounded = value

func get_wounded():
	return wounded

func set_sick(value):
	sick = value

func get_sick():
	return sick

func set_total_troops(value):
	total_troops = value

func get_total_troops():
	return total_troops

func set_activity(value):
	activity = value

func get_activity():
	return activity

func set_fighting(value):
	fighting = value

func get_fighting():
	return fighting

func set_resting(value):
	resting = value

func get_resting():
	return resting

func set_shock(value):
	shock = value

func get_shock():
	return shock

func set_discipline(value):
	activity = discipline

func get_discipline():
	return discipline

func set_assault(value):
	assault = value

func get_assault():
	return assault

func set_retaliation(value):
	retaliation = value

func get_retaliation():
	return retaliation

func set_fortitude(value):
	fortitude = value

func get_fortitude():
	return fortitude

func set_lethality(value):
	lethality = value

func get_lethality():
	return lethality

func set_total_losses(value):
	total_losses = value

func get_total_losses():
	return total_losses

func set_total_dead(value):
	total_dead = value

func get_total_dead():
	return total_dead

func set_troop_type(value):
	troop_type = value

func get_troop_type():
	return troop_type

func _ready():
	pass

func constrain(val, maximum, minimum):
	if (val > maximum):
		return maximum
	elif (val < minimum):
		return minimum
	return val

func assault(enemy_troop_strength, enemy_morale, enemy_maximum_morale, enemy_assault, enemy_lethality, enemy_fortitude, enemy_total_losses):
	random.randomize()
	var rand = random.randi_range(enemy_troop_strength/2.0, float(enemy_troop_strength))
	var enemy_morale_percent = enemy_morale/float(enemy_maximum_morale)
	var attack = enemy_assault - fortitude
	print ("rand " + str(rand) + " percent " + str(enemy_morale_percent) + " attack " + str(attack))
	var loss = constrain(rand*enemy_morale_percent*attack, troop_strength - total_losses, 0)
	total_losses += loss
	total_dead = total_losses*enemy_lethality
	return constrain(round(random.randfn(troop_strength/2.0, float(troop_strength))*(morale/float(maximum_morale))*(retaliation - enemy_fortitude)), enemy_troop_strength - enemy_total_losses, 0)

func shock(enemy_shock):
	total_moral_loss += constrain((enemy_shock - discipline), (morale - total_moral_loss), 0)

func total_damages():
	troop_strength -= total_losses
	wounded += (total_losses - total_dead)
	morale -= total_moral_loss
	total_losses = 0
	total_dead = 0
	total_moral_loss = 0
	if (troop_strength == 0):
		activity = false

func update_morale():
	constrain(morale, maximum_morale, 0)
	if (activity == true and morale == 0):
		activity = false
	if (activity == false and morale >= Defines.MORALE_THRESHOLD and fighting == false):
		activity = true
	if (morale < maximum_morale and fighting == false):
		morale += constrain((morale_recovery*(maximum_morale - morale)), (maximum_morale - morale), 1)

func update_weariness():
	if (fighting == false and resting == false and weariness < Defines.MAX_WEARINESS):
		weariness += weariness_increase
	elif (fighting == true and weariness < Defines.MAX_WEARINESS):
		weariness += weariness_increase*2
	elif (resting == true and weariness > 0):
		weariness -= weariness_decrease
	constrain(weariness, Defines.MAX_WEARINESS, 0)

func _init(unit_type = "Infantry"):
	troop_type = unit_type

func _process(delta):
	total_troops = troop_strength + wounded + sick
	update_morale()
	#update_weariness()
	
	
