"""
---------------------------------------------------------------------------------------------------

[Insert file description]

Authors: Warren Nguyen

---------------------------------------------------------------------------------------------------
"""


extends KinematicBody2D

var clicked = false
var hovering = false
var movement_speed = 10
var selectable = false
var destinationX 
var destinationY 
var team

var army_width = 4
var cav_inf_ratio
var army_depth

var battalion_matrix

var infantry_list = []
var cavalry_list = []
var archer_list = []
var artillery_list = []

func create_2d_array(width):
	var a = []
	if ((cavalry_list.size() + infantry_list.size()) < width):
		width = cavalry_list.size() + infantry_list.size()
	army_depth = ceil((infantry_list.size() + cavalry_list.size() + archer_list.size() + artillery_list.size())/width)
	
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
			fill_inf_cav(a[y], width)
		else:
			fill_archers(a[y], width)
	return a

func fill_inf_cav(row, width):
	if (cavalry_list.size() == 0):
		for x in range(width):
			if (infantry_list.size() > 1):
				row[x] = infantry_list.pop_front()
			elif (archer_list.size() > 1):
				row[x] = archer_list.pop_front()
			elif (artillery_list.size() > 1):
				row[x] = artillery_list.pop_front()
	else:
		var local_ratio
		if ((cav_inf_ratio*2 - 1) <= cavalry_list.size()):
			local_ratio = cav_inf_ratio
		else:
			if (cavalry_list.size() <= 2):
				local_ratio = 1
			elif (cavalry_list.size() <= 4):
				local_ratio = 2
			elif (cavalry_list.size() <= 6):
				local_ratio = 3
		
		var left_bound = local_ratio
		var right_bound = local_ratio
		
		if (local_ratio*2 > cavalry_list.size()):
			left_bound = floor(cavalry_list.size()/2)
			right_bound = ceil(cavalry_list.size()/2)
		
		for x in range(width):
			if (x < left_bound or x > (width - right_bound - 1)):
				row[x] = cavalry_list.pop_front()
			else:
				if (infantry_list.size() > 0):
					row[x] = infantry_list.pop_front()
				elif (cavalry_list.size() > right_bound):
					row[x] = cavalry_list.pop_front()
				elif (archer_list.size() > 0):
					row[x] = archer_list.pop_front()
				elif (artillery_list.size() > 0):
					row[x] = artillery_list.pop_front()


func fill_archers(row, width):
		if (archer_list.size() > 0):
			for x in range(width):
				if (archer_list.size() > 0):
					row[x] = archer_list.pop_front()
				elif (infantry_list.size() > 0):
					row[x] = infantry_list.pop_front()
				elif (cavalry_list.size() > 0):
					row[x] = cavalry_list.pop_front()
				elif (artillery_list.size() > 0):
					row[x] = artillery_list.pop_front()
		else:
			fill_inf_cav(row, width)

func formation_matrix():
	battalion_matrix = create_2d_array(army_width)
	print(battalion_matrix)


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
	
	infantry_list = ["x","x","x","x","x"]
	archer_list = ["y","y","y","y","y","y"]
	cavalry_list = ["z","z","z","z","z","z","z","z"]
	artillery_list = ["w","w","w","w","w","w","w","w"]
	
	formation_matrix()
	
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
		elif event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
			if clicked == true:
				destinationX = get_global_mouse_position().x
				destinationY = get_global_mouse_position().y

func _on_Area2D_mouse_entered():
	hovering = true


func _on_Area2D_mouse_exited():
	hovering = false


func _on_Area2D_body_entered(body):
	if body.team != team:
		print("HUZZAH")
