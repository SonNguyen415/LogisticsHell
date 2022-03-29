extends Sprite


# Declare member variables here. Examples:
var clicked = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)) and clicked == false:
			clicked = true
			print("selected")
		elif get_rect().has_point(to_local(event.position)) and clicked == true:
			clicked = false
			print("deselected")
		elif clicked == true:
			global_position = get_global_mouse_position()
			clicked = false
			print("move")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
