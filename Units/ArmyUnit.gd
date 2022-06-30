"""
---------------------------------------------------------------------------------------------------

Includes everything regarding army interactions with users and the other classes. It holds matrixes
and lists of the Battalion class. Includes code for movement and signals.

Authors: Warren Nguyen

---------------------------------------------------------------------------------------------------
"""


extends KinematicBody2D

#Variables that involve selection and movement
var clicked = false
var hovering = false
var movement_speed = 10
var selectable = false
var destinationX 
var destinationY 
var team

#Variables that involve the army matrix
var army_width = 10
var cav_inf_ratio
var army_depth
var battalion_matrix
var combat = false
var injured = []
var enemy_army

#Lists that hold the Battalions when out of combat
var infantry_list = []
var cavalry_list = []
var archer_list = []
var artillery_list = []

#Function that creates the battle matrix when fighting
func create_2d_array(width):
	var infantry_able_list = []
	var cavalry_able_list = []
	var archer_able_list = []
	var artillery_able_list = []
	
	for i in range(infantry_list.size()):
		if (infantry_list[i].activity == true):
			infantry_able_list.append(infantry_list[i])
	
	for i in range(cavalry_list.size()):
		if (cavalry_list[i].activity == true):
			cavalry_able_list.append(cavalry_list[i])
	
	for i in range(archer_list.size()):
		if (archer_list[i].activity == true):
			archer_able_list.append(archer_list[i])
	
	for i in range(artillery_list.size()):
		if (artillery_list[i].activity == true):
			artillery_able_list.append(artillery_list[i])
	
	var a = []
	if ((cavalry_able_list.size() + infantry_able_list.size()) < width):
		width = cavalry_able_list.size() + infantry_able_list.size()
	army_depth = ceil((infantry_able_list.size() + cavalry_able_list.size() + archer_able_list.size() + artillery_able_list.size())/float(width))
	
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
			fill_inf_cav(a[y], width, infantry_able_list, cavalry_able_list, archer_able_list, artillery_able_list)
		else:
			fill_archers(a[y], width, infantry_able_list, cavalry_able_list, archer_able_list, artillery_able_list)
	return a

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

func _init(team_allocation = "Player", infantry_amount = [], archer_amount = [], cavalry_amount = [], artillery_amount = []):
	team = team_allocation
	infantry_list = infantry_amount
	archer_list = archer_amount
	cavalry_list = cavalry_amount
	artillery_list = artillery_amount
	

# Called when the node enters the scene tree for the first time.
func _ready():
	destinationX = global_position.x
	destinationY = global_position.y
	
	if (team == "Player"):
		selectable = true

#Army movement, if the distance is more than 2 times the movement speed, move

func _process(delta):
	var distance = global_position.distance_to(Vector2(destinationX, destinationY));
	if (distance > movement_speed*2):
		var cosine = (destinationX-global_position.x)/distance
		var sine = (destinationY-global_position.y)/distance
		global_position.x += cosine*movement_speed
		global_position.y += sine*movement_speed
	elif clicked == false:
		modulate = Color.white
		
	if (combat == true):
		for y in range(battalion_matrix.size()):
			for x in range(battalion_matrix[y].size()):
				if(battalion_matrix[y][x] != null and battalion_matrix[y][x].activity == false):
					var temp = battalion_matrix[y][x]
					battalion_matrix[y][x] = null
					injured.append(temp)

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
	if body.team != team:
		destinationX = global_position.x
		destinationY = global_position.y
		battalion_matrix = create_2d_array(army_width)
		combat = true
		for y in range(battalion_matrix.size()):
			for x in range(battalion_matrix[y].size()):
				if (battalion_matrix[y][x] != null):
					battalion_matrix[y][x].fighting = true
