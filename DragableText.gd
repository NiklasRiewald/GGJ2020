extends Area2D

var dragMouse = false
var lastMouseX;
var lastMouseY;

var separators = []

# Called when the node enters the scene tree for the first time.
func _ready():
	separators = [
		get_node("../separator1")
	]
	separators[0].modulate = Color(0, 0, 1)
	pass # Replace with function body.


func _process(delta):
	if dragMouse:
		set_global_position(
			Vector2(
				get_global_position().x + get_global_mouse_position().x - lastMouseX,
				get_global_position().y + get_global_mouse_position().y - lastMouseY
				)
			)
	lastMouseX = get_global_mouse_position().x
	lastMouseY = get_global_mouse_position().y



func _on_Area2D_input_event(viewport, event, shape_idx):
	print("ne")
	if event is InputEventMouseButton:
		print("ok")
		if event.is_pressed():
			dragMouse=true
		else:
			dragMouse=false
	pass
