extends Sprite


# Declare member variables here. Examples:
var clicked = false;
var destinationX = position.x
var destinationY = position.y
var movementSpeed = 10

var team = -1
var selectable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	destinationX = global_position.x
	destinationY = global_position.y
	if (team == 0):
		selectable = true

#Army movement, if the distance is more than 2 times the movement speed, move

func _process(delta):
	var distance = global_position.distance_to(Vector2(destinationX, destinationY));
	if (distance > movementSpeed*2):
		var cosine = (destinationX-global_position.x)/distance
		var sine = (destinationY-global_position.y)/distance
		global_position.x += cosine*movementSpeed
		global_position.y += sine*movementSpeed
	elif clicked == false:
		modulate = Color.white
		
#Player input, if you click on the army, it selects it, click on it again, deselects, right click somewhere, activates movement

func _input(event):
	if (selectable == true):
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			if get_rect().has_point(to_local(event.position)) and clicked == false:
				clicked = true
				modulate = Color.red
			elif get_rect().has_point(to_local(event.position)) and clicked == true:
				clicked = false
				modulate = Color.white
		elif event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_RIGHT:
			if clicked == true:
				destinationX = get_global_mouse_position().x
				destinationY = get_global_mouse_position().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
