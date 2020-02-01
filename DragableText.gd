extends Area2D

var dragMouse = false
var lastMouseX;
var lastMouseY;

var separators = []
var texts = []
var numberSeparators = 0

var active_text_index = 0

var hadActiveDragLastFrame = false

var isNewParagraph = false

var newParagraph

var originalPosition

var originalSiteIndex = 0

var logs

var popUp: AcceptDialog

# Called when the node enters the scene tree for the first time.
func _ready():
	separators = [
		get_node("../separator1"),
		get_node("../separator2"),
		get_node("../separator3"),
		get_node("../separator4")
	]
	texts = [
		get_node("../Text1/RichTextLabel"),
		get_node("../Text2/RichTextLabel"),
		get_node("../Text3/RichTextLabel")
	]
	newParagraph = get_node("../TextNew/RichTextLabel")
	popUp = get_node("../AcceptDialog")
	logs = get_node("../Log")
	
	numberSeparators=len(separators)
	
	if get_node("RichTextLabel") == newParagraph:
		isNewParagraph=true
		
	if get_node("RichTextLabel") == texts[1]:
		originalSiteIndex = 1
	if get_node("RichTextLabel") == texts[2]:
		originalSiteIndex = 2
	
		
	originalPosition = get_global_position()
	
	logs._update_paragraphs()


func _process(delta):
	var currentMouseX = get_global_mouse_position().x
	var currentMouseY = get_global_mouse_position().y
	
	if dragMouse:
		if logs.isEndText and get_node("RichTextLabel") == newParagraph:
			_end_game()
		
		set_global_position(
			Vector2(
				get_global_position().x + currentMouseX - lastMouseX,
				get_global_position().y + currentMouseY - lastMouseY
				)
			)
		hadActiveDragLastFrame = true
	else:
		if hadActiveDragLastFrame:
			set_global_position(originalPosition)
			print(logs.paragraphs)
			var textToInsert = get_node("RichTextLabel").bbcode_text
			var index_to_insert = logs.current_position * (numberSeparators -1) + active_text_index
			if isNewParagraph and len(logs.paragraphs) >= index_to_insert:
				logs.paragraphs.insert(
					index_to_insert,
					textToInsert
				)
				logs._push_new_update()
			else:
				if len(logs.paragraphs) > index_to_insert:
					var textToSwitch = logs.paragraphs[index_to_insert]
					logs.paragraphs[index_to_insert] = textToInsert
					var index_to_switch_from = logs.current_position * (numberSeparators -1) + originalSiteIndex
					logs.paragraphs[index_to_switch_from] = textToSwitch
			logs._update_paragraphs()
				
		hadActiveDragLastFrame = false
		
	
	for i in range(0, numberSeparators):
		var minY = separators[i].get_global_position().y
		var maxY = 86856527
		if i < numberSeparators - 1:
			maxY = separators[i+1].get_global_position().y
		
		if currentMouseY >= minY and currentMouseY <= maxY:
			_toggle_separator(i)
		
		
	lastMouseX = get_global_mouse_position().x
	lastMouseY = get_global_mouse_position().y
	


func _toggle_separator(separator_index):
	for separator in separators:
		separator.modulate = Color(1, 1, 1)
		active_text_index = separator_index
	separators[separator_index].modulate = Color(0, 0, 1)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragMouse=true
		else:
			dragMouse=false
	pass
		
func _end_game():
	dragMouse=false
	popUp.set_title("")
	if _correct_solution():
		popUp.set_text("Congratulations! You figured it out correctly!")
	else:
		popUp.set_text("Sorry, but the story is still somewhat out of order.")
	popUp.popup_centered()
	print("end_game!")
	
func _correct_solution():
	return logs.paragraphs == logs.correct_solution
