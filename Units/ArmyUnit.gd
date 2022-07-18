"""
---------------------------------------------------------------------------------------------------

Includes everything regarding army interactions with users and the other classes. It holds matrixes
and lists of the Battalion class. Includes code for movement and signals.

Authors: Warren Nguyen

---------------------------------------------------------------------------------------------------
"""


extends KinematicBody2D



#Lists that hold the Battalions
var infantry_list = []
var cavalry_list = []
var archer_list = []
var artillery_list = []
var baggage_train = []

# Other Army fields
var location
var total_morale 
var total_weariness 
var total_supplies

#Variables that involve selection and movement
var clicked = false
var hovering = false
var movement_speed = 10
var selectable = false
var destinationX 
var destinationY 
var team setget set_team, get_team

#Variables that involve the army matrix
var army_width = 4
var width setget set_width, get_width
var cav_inf_ratio
var army_depth setget set_army_depth, get_army_depth
var battalion_matrix setget set_battalion, get_battalion
var combat = false setget set_combat, get_combat
var injured = []
var enemy_army
var formation = false setget set_formation, get_formation
signal formation
var ready = true setget set_ready, get_ready
var current_state = "Start" setget set_state, get_state
var opening = false

#Sets and Gets
func set_team(value):
	team = value

func get_team():
	return team

func set_width(value):
	width = value

func get_width():
	return width

func set_army_depth(value):
	width = army_depth

func get_army_depth():
	return army_depth

func set_battalion(value):
	battalion_matrix = value

func get_battalion():
	return battalion_matrix

func set_combat(value):
	combat = value

func get_combat():
	return combat

func set_formation(value):
	formation = value

func get_formation():
	return formation

func set_ready(value):
	ready = value

func get_ready():
	return ready

func set_state(value):
	current_state = value

func get_state():
	return current_state

#Initializing Function
func _init(tile_loc = 1, team_allocation = "Player", infantry_amount = [], archer_amount = [], cavalry_amount = [], artillery_amount = []):
	team = team_allocation
	location = tile_loc
	infantry_list = infantry_amount
	archer_list = archer_amount
	cavalry_list = cavalry_amount
	artillery_list = artillery_amount

#Called when the node enters the scene tree for the first time.
func _ready():
	destinationX = global_position.x
	destinationY = global_position.y
	if (team == "Player"):
		selectable = true

#Function that creates the battle matrix when fighting
func create_2d_array():
	var inf_list = []
	var cav_list = []
	var arch_list = []
	var siege_list = []
	
	for i in range(infantry_list.size()):
		if (infantry_list[i].get_activity() == true):
			inf_list.append(infantry_list[i])
	
	for i in range(cavalry_list.size()):
		if (cavalry_list[i].get_activity() == true):
			cav_list.append(cavalry_list[i])
	
	for i in range(archer_list.size()):
		if (archer_list[i].get_activity() == true):
			arch_list.append(archer_list[i])
	
	for i in range(artillery_list.size()):
		if (artillery_list[i].get_activity() == true):
			siege_list.append(artillery_list[i])
	
	var a = []
	width = army_width
	
	if ((cav_list.size() + inf_list.size()) < width):
		if ((cav_list.size() + inf_list.size() + arch_list.size())/2 < width):
			if (cav_list.size() + inf_list.size() < arch_list.size()):
				width = ceil((cav_list.size() + inf_list.size() + arch_list.size())/2.0)
			elif (cav_list.size() + inf_list.size() > 1):
				width = cav_list.size() + inf_list.size()
			else:
				width = 1
	
	army_depth = ceil((inf_list.size() + cav_list.size() + arch_list.size() + siege_list.size())/float(width))
	
	if (width >= 1 and width <= 8):
		cav_inf_ratio = 1
	elif (width >= 9 and width <= 16):
		cav_inf_ratio = 2
	elif (width >= 17 and width <= 32):
		cav_inf_ratio = 3
	else:
		cav_inf_ratio = 4
	
	for y in range(army_depth):
		a.append([])
		a[y].resize(width)
	
	for y in range(army_depth):
		if (y%2 == 0):
			fill_inf_cav(a[y], width, inf_list, cav_list, arch_list, siege_list)
		else:
			fill_archers(a[y], width, inf_list, cav_list, arch_list, siege_list)

	return a

#Function that fills the infantry and cavalary rows
func fill_inf_cav(row, width, inf, cav, arch, siege):
	if (cav.size() == 0):
		for x in range(width):
			if (inf.size() > 0):
				row[x] = inf.pop_front()
			elif (arch.size() > 0):
				row[x] = arch.pop_front()
			elif (siege.size() > 0):
				row[x] = siege.pop_front()
	else:
		var local_ratio
		if ((cav_inf_ratio*2 - 1) <= cav.size()):
			local_ratio = cav_inf_ratio
		else:
			if (cav.size() <= 2):
				local_ratio = 1
			elif (cav.size() <= 4):
				local_ratio = 2
			elif (cav.size() <= 6):
				local_ratio = 3
		
		var left_bound = local_ratio
		var right_bound = local_ratio
		
		if (local_ratio*2 > cav.size()):
			left_bound = floor(cav.size()/2.0)
			right_bound = ceil(cav.size()/2.0)
		
		for x in range(width):
			if (x < left_bound or x > (width - right_bound - 1)):
				row[x] = cav.pop_front()
			else:
				if (inf.size() > 0):
					row[x] = inf.pop_front()
				elif (cav.size() > right_bound):
					row[x] = cav.pop_front()
				elif (arch.size() > 0):
					row[x] = arch.pop_front()
				elif (siege.size() > 0):
					row[x] = siege.pop_front()

#Function that fills the archer rows
func fill_archers(row, width, inf, cav, arch, siege):
	if (arch.size() > 0):
		for x in range(width):
			if (arch.size() > 0):
				row[x] = arch.pop_front()
			elif (inf.size() > 0):
				row[x] = inf.pop_front()
			elif (cav.size() > 0):
				row[x] = cav.pop_front()
			elif (siege.size() > 0):
				row[x] = siege.pop_front()
	else:
		fill_inf_cav(row, width, inf, cav, arch, siege)

#Function called every tick
func _process(delta):
	var distance = global_position.distance_to(Vector2(destinationX, destinationY));
	if (distance > movement_speed*2):
		movement(delta)
	elif (clicked == false and modulate != Color.white):
		modulate = Color.white
	if (formation == true):
		emit_signal("formation")
	if (combat == true and enemy_army.get_ready() == true):
		enemy_army.set_ready(false)
		battle()

#Function that makes the sprite point towards a thing
func point_towards(x, y):
	look_at(Vector2(x, y))
	set_global_rotation_degrees(get_global_rotation_degrees() + 90)

#Army movement, if the distance is more than 2 times the movement speed, move
func movement(delta):
	global_position = global_position.move_toward(Vector2(destinationX, destinationY), delta * movement_speed * 20)
	point_towards(destinationX, destinationY)

#Player input, if you click on the army, it selects it, click on it again, deselects, right click somewhere, activates movement
func _input(event):
	if (selectable == true):
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			if hovering == true and clicked == false:
				clicked = true
				modulate = Color.red
			elif hovering == true and clicked == true:
				clicked = false
				modulate = Color.white
		elif event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT and combat == false:
			if clicked == true:
				destinationX = get_global_mouse_position().x
				destinationY = get_global_mouse_position().y

#Mouse Detection
func _on_Area2D_mouse_entered():
	hovering = true

func _on_Area2D_mouse_exited():
	hovering = false

#Collisions with enemies
func _on_Area2D_body_entered(body):
	if body.get_team() != team:
		enemy_army = body
		start_battle()

#Initiation of the battle
func start_battle():
	destinationX = global_position.x
	destinationY = global_position.y
	point_towards(enemy_army.global_position.x, enemy_army.global_position.y)
	battalion_matrix = create_2d_array()
	formation = true
	yield(enemy_army, "formation")
	enemy_army.set_formation(false)
	for y in range(battalion_matrix.size()):
		for x in range(battalion_matrix[y].size()):
			if (battalion_matrix[y][x] != null):
				battalion_matrix[y][x].set_fighting(true)
	combat = true

#Function that goes through the phases of the battle
func battle():
	match (current_state):
		"Start":
			reformation_phase()
			current_state = "Attack"
		"Reform":
			reformation_phase()
			current_state = "Rout"
		"Rout":
			rout_phase()
			if (opening == true):
				current_state = "Attack"
				opening = false
			else:
				current_state = "Reinforce"
				opening = true
		"Reinforce":
			reinforce_phase()
			current_state = "Attack"
		"Attack":
			attack_phase()
			current_state = "Defend"
		"Defend":
			defend_phase()
			current_state = "Clean"
		"Clean":
			cleaning_phase()
			current_state = "Reform"
	ready = true

#Function that reforms the array if the combattants are unaligned
func reformation_phase():
	pass

func rout_phase():
	var routed = true
	for y in range(battalion_matrix.size()):
		for x in range(battalion_matrix[y].size()):
			if (battalion_matrix[x][y] != null):
				routed = false
	if (routed == true):
		enemy_army.set_combat(false)
		enemy_army.set_state("Start")
		self.queue_free()

#Function that siphons units from the back ranks into the empty slots
func reinforce_phase():
	pass

#Function that has the units attack
func attack_phase():
	var rows
	if (army_depth > 1):
		rows = 2
	else:
		rows = 1
	
	for y in range(rows):
		for x in range(battalion_matrix[0].size()):
			if (battalion_matrix[y][x] != null):
				if (width == enemy_army.get_width() or width == enemy_army.get_width() - 1):
					attack(width - 1, battalion_matrix[y][x], x, y)
				elif (width == enemy_army.get_width() + 1):
					attack(enemy_army.get_width() - 1, battalion_matrix[y][x], x, y)
				elif (width == enemy_army.get_width() - 2):
					attack(width, battalion_matrix[y][x], x, y)
				elif (width == enemy_army.get_width() + 2):
					attack(enemy_army.get_width(), battalion_matrix[y][x], x, y)

func attack(pos, battalion, shift, row):
	if (row == 1 and battalion.get_troop_type() != "Archer"):
		return
	
	var enemy_battalion
	if ((pos - shift) == enemy_army.get_width()):
		if (enemy_army.get_battalion()[0][enemy_army.get_width() - 1] != null):
			enemy_battalion = enemy_army.get_battalion()[0][enemy_army.get_width() - 1]
		else:
			return
	elif ((pos - shift) == - 1):
		if (enemy_army.get_battalion()[0][0] != null):
			enemy_battalion = enemy_army.get_battalion()[0][0]
		else:
			return
	else:
		if (enemy_army.get_battalion()[0][0] != null):
			enemy_battalion = enemy_army.get_battalion()[0][pos - shift]
		else:
			if (((pos - shift + 1) != enemy_army.get_width()) and (enemy_army.get_battalion()[0][pos - shift + 1] != null)):
				enemy_battalion = enemy_army.get_battalion()[0][pos - shift + 1]
			elif (((pos - shift - 1) != - 1) and (enemy_army.get_battalion()[0][pos - shift - 1] != null)):
				enemy_battalion = enemy_army.get_battalion()[0][pos - shift - 1]
			elif (enemy_army.get_army_depth() > 1 and (enemy_army.get_battalion()[1][pos - shift] != null)):
				enemy_battalion = enemy_army.get_battalion()[1][pos - shift]
	enemy_battalion.shock(battalion.get_shock())
	var retaliation_damage = enemy_battalion.assault(battalion.get_troop_strength(), battalion.get_morale(), battalion.get_maximum_morale(), battalion.get_assault(), battalion.get_lethality(), battalion.get_fortitude(), battalion.get_total_losses())
	battalion.set_total_losses(battalion.get_total_losses() + retaliation_damage)
	battalion.set_total_dead(battalion.get_total_dead() + enemy_battalion.get_lethality()*retaliation_damage)

#Function that has the units take damage
func defend_phase():
	for y in range(battalion_matrix.size()):
		for x in range(battalion_matrix[y].size()):
			if (battalion_matrix[y][x] != null):
				battalion_matrix[y][x].total_damages()
				battalion_matrix[y][x].update_weariness()
				print(team + " Troop Strength: " + str(battalion_matrix[y][x].get_troop_strength()) + " Injured: " + str(battalion_matrix[y][x].get_wounded()) + " Morale: " + str(battalion_matrix[y][x].get_morale()) + " Weariness: " + str(battalion_matrix[y][x].get_weariness()))

#Function that removes the units that have been routed
func cleaning_phase():
	for y in range(battalion_matrix.size()):
			for x in range(battalion_matrix[y].size()):
				if(battalion_matrix[y][x] != null and battalion_matrix[y][x].get_activity() == false):
					injured.append(battalion_matrix)
					battalion_matrix[y][x] = null
