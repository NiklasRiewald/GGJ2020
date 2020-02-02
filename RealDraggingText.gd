extends RichTextLabel

var separators = []
var numberSeparators = 0

var lastMouseX;
var lastMouseY;

func _ready():
	pass

func _process(delta):
	var currentMouseX = get_global_mouse_position().x
	var currentMouseY = get_global_mouse_position().y
