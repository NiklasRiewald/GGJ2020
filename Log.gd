extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var texts = [
	"[b][u]Page 1[/u][/b]",
	"[b][u]Page 2[/u][/b]",
	"[b][u]Page 3[/u][/b]",
	"[b][u]Page 4[/u][/b]",
	"[b][u]Page 5[/u][/b]",
	"[b][u]Page 6[/u][/b]",
]

var paragraphs = []

var current_position = 0

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			# nach hinten blättern
			if event.button_index == BUTTON_WHEEL_UP:
				if current_position != 0:
					 current_position-=1
			# nach vorne blättern
			if event.button_index == BUTTON_WHEEL_DOWN:
				if current_position != len(texts) - 1:
					 current_position+=1
	set_bbcode(texts[current_position])
