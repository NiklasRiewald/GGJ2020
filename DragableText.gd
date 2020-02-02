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

var paragraphClone = ""
var cloneIndex

var logs

var popUp: AcceptDialog

var draggableText

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
	draggableText = get_node("../DraggingText")
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
	var myText = get_node("RichTextLabel").bbcode_text
	if dragMouse and (myText != "" or draggableText.bbcode_text != ""):
		if not hadActiveDragLastFrame:
			#create draggable text:
			paragraphClone = get_node("RichTextLabel").bbcode_text
			cloneIndex = _get_paragraph_index()
			
			if not _is_new_paragraph():
				get_node("RichTextLabel").set_bbcode("")
				var index_to_remove = _get_paragraph_index()
				logs.paragraphs[index_to_remove] = ""

			draggableText.set_global_position(get_global_position())
			draggableText.set_bbcode(paragraphClone)
		if logs.isEndText and get_node("RichTextLabel") == newParagraph:
			_end_game()
		
		draggableText.set_global_position(
			Vector2(
				draggableText.get_global_position().x + currentMouseX - lastMouseX,
				draggableText.get_global_position().y + currentMouseY - lastMouseY
				)
			)
		hadActiveDragLastFrame = true
	else:
		if draggableText.bbcode_text != "":
			_insert_paragraph()		
		hadActiveDragLastFrame = false
		
	_toggle_separators()
		
	lastMouseX = get_global_mouse_position().x
	lastMouseY = get_global_mouse_position().y

func _get_paragraph_index():
	return logs.current_position * (numberSeparators -1) + originalSiteIndex

func _toggle_separators():
	var currentMouseX = get_global_mouse_position().x
	var currentMouseY = get_global_mouse_position().y
	for i in range(0, numberSeparators):
		var minY = separators[i].get_global_position().y
		var maxY = 86856527
		if i < numberSeparators - 1:
			maxY = separators[i+1].get_global_position().y
		
		if currentMouseY >= minY and currentMouseY <= maxY:
			_toggle_separator(i)

func _insert_paragraph():
	if hadActiveDragLastFrame and not ( logs.isEndText and _is_new_paragraph()):
		set_global_position(originalPosition)
		var index_to_insert = logs.current_position * (numberSeparators -1) + active_text_index
		if isNewParagraph and len(logs.paragraphs) >= index_to_insert:
			logs.paragraphs.insert(
				index_to_insert,
				paragraphClone
			)
			logs._push_new_update()
		else:
			if len(logs.paragraphs) > index_to_insert:
				print("before insertion:")
				print(logs.paragraphs)
				logs.paragraphs.insert(
					index_to_insert,
					paragraphClone
				)
				print("after insertion:")
				print(logs.paragraphs)
				var index_to_remove = cloneIndex
				if index_to_remove >= index_to_insert:
					index_to_remove += 1
					
				print("index to remove:")
				print(index_to_remove)
				logs.paragraphs.remove(index_to_remove)
				print("after removal:")
				print(logs.paragraphs)
			else:
				#restore original text here:
				if not _is_new_paragraph():
					logs.paragraphs[cloneIndex] = paragraphClone
				
				
		logs._update_paragraphs()
		draggableText.set_bbcode("")

func _is_new_paragraph():
	return get_node("RichTextLabel") == newParagraph

func _toggle_separator(separator_index):
	for separator in separators:
		separator.modulate = Color(1, 1, 1)
		active_text_index = separator_index
	separators[separator_index].modulate = Color(0, 0, 1)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.is_pressed():
			dragMouse=true
		#else:
			#dragMouse=false
			
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if not event.is_pressed():
			if dragMouse:
				dragMouse=false
	
func _end_game():
	dragMouse=false
	popUp.set_title("")
	var matches = _count_matches()
	if matches == len(logs.paragraphs):
		popUp.set_text("Congratulations! You figured it out correctly!")
	else:
		popUp.set_text("The story is still somewhat out of order: " + str(matches) + " out of " + str(len(logs.paragraphs)) + " paragraphs are matching.")
	popUp.popup_centered()
	
func _count_matches():
	var matches = 0
	var i=0
	for paragraph in logs.paragraphs:
		if paragraph == logs.correct_solution[i]:
			matches +=1
		else:
			print(paragraph)
		i+=1
	return matches
