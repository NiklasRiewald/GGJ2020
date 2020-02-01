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

var currentPage = 0

var end_text = "You now have all parts of the story. Click here if you think you have figured out the correct order!"

var logs

var isEndText = false

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
	logs = get_node("../Log")
	
	numberSeparators=len(separators)
	
	if get_node("RichTextLabel") == newParagraph:
		isNewParagraph=true
		
	if get_node("RichTextLabel") == texts[1]:
		originalSiteIndex = 1
	if get_node("RichTextLabel") == texts[2]:
		originalSiteIndex = 2
	
		
	originalPosition = get_global_position()
	
	_push_new_update()
	_update_paragraphs()


func _process(delta):
	var currentMouseX = get_global_mouse_position().x
	var currentMouseY = get_global_mouse_position().y
	
	if dragMouse:
		if isEndText:
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
			var index_to_insert = currentPage * (numberSeparators -1) + active_text_index
			if isNewParagraph:
				if len(logs.paragraphs) % (numberSeparators -1) == 1 and active_text_index == 2:
					logs.paragraphs.insert(
						index_to_insert -1,
						""
					)
				logs.paragraphs.insert(
					index_to_insert,
					textToInsert
				)
				_push_new_update()
			else:
				var textToSwitch = logs.paragraphs[index_to_insert]
				logs.paragraphs[index_to_insert] = textToInsert
				var index_to_switch_from = currentPage * (numberSeparators -1) + originalSiteIndex
				print(index_to_switch_from)
				logs.paragraphs[index_to_switch_from] = textToSwitch
			_update_paragraphs()
				
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
	
func _update_paragraphs():
	var start_index = currentPage * (numberSeparators - 1)
	var end_index = start_index + numberSeparators - 1
	var j = 0
	for i in range(start_index, end_index):
		if i < len(logs.paragraphs):
			texts[j].set_bbcode(logs.paragraphs[i])
			j +=1

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

func _push_new_update():
	if len(logs.new_paragraphs) > 0:
		newParagraph.set_bbcode(logs.new_paragraphs.pop_front())
	else:
		newParagraph.set_bbcode(end_text)
		isEndText = true
		
func _end_game():
	print("end_game!")
