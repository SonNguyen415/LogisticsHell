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

var initial_battalion = preload("res://Units/BattalionUnit.tscn").instance()
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
				row[x] = infantry_list.erase()
			elif (archer_list.size() > 1):
				row[x] = cavalry_list.erase()
			elif (artillery_list.size() > 1):
				row[x] = artillery_list.erase()
	if (cav_inf_ratio == 1 or cavalry_list.size() <= 2):
		if (infantry_list.size >= (width - 2) and cavalry_list.size() >= 2):
			for x in range(width):
				if (x == 0 or x == width - 1):
					row[x] = cavalry_list.erase()
				else:
					#stopped here
					if (infantry_list.size() > 1):
						row[x] = infantry_list.erase()
					elif (cavalry_list.size() > 1):
						row[x] = cavalry_list.erase()
					elif (artillery_list.size() > 1):
						row[x] = artillery_list.erase()
	elif (cav_inf_ratio == 2 or cavalry_list.size() <= 4):
		if (infantry_list.size >= (width - 4) and cavalry_list.size() >= 4):
			for x in range(width):
				if (x <= 1 or x >= width - 2):
					row[x] = cavalry_list.erase()
				else:
					row[x] = infantry_list.erase()
	elif (cav_inf_ratio == 3 or cavalry_list.size() <= 6):
		if (infantry_list.size >= (width - 6) and cavalry_list.size() >= 6):
			for x in range(width):
				if (x <= 2 or x >= width - 3):
					row[x] = cavalry_list.erase()
				else:
					row[x] = infantry_list.erase()
	elif (cav_inf_ratio == 4):
		if (infantry_list.size >= (width - 8) and cavalry_list.size() >= 8):
			for x in range(width):
				if (x <= 3 or x >= width - 4):
					row[x] = cavalry_list.erase()
				else:
					row[x] = infantry_list.erase()

func fill_archers(row, width):
		if (archer_list.size() > 1):
			for x in range(width):
				if (archer_list.size() > 1):
					row[x] = archer_list.erase()
				elif (infantry_list.size() > 1):
					row[x] = infantry_list.erase()
				elif (cavalry_list.size() > 1):
					row[x] = cavalry_list.erase()
				elif (artillery_list.size() > 1):
					row[x] = artillery_list.erase()
		else:
			fill_inf_cav(row, width)

func formation_matrix():
	battalion_matrix = create_2d_array(army_width)


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
