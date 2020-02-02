extends RichTextLabel

var numberSeparators = 4

var pageTitles = [
	"[b][u]Page 1[/u][/b]",
	"[b][u]Page 2[/u][/b]",
	"[b][u]Page 3[/u][/b]",
	"[b][u]Page 4[/u][/b]",
	"[b][u]Page 5[/u][/b]",
	"[b][u]Page 6[/u][/b]",
]

var paragraphs = [
	"first sentence",
]

var new_paragraphs = [
	"first new paragraph",
	"seconds new paragraph",
	"seventh new paragraph",
	"fourth new paragraph",
	"fifth new paragraph",
	"sixth new paragraph",
	"third new paragraph"
]

var correct_solution = [
	"first sentence",
	"first new paragraph",
	"seconds new paragraph",
	"third new paragraph",
	"fourth new paragraph",
	"fifth new paragraph",
	"sixth new paragraph",
	"seventh new paragraph",
]

var texts

var end_text = "You now have all parts of the story. Click here if you think you have figured out the correct order!"

var current_position = 0

var newParagraph

var isEndText = false

func _ready():
	texts = [
		get_node("../Text1/RichTextLabel"),
		get_node("../Text2/RichTextLabel"),
		get_node("../Text3/RichTextLabel")
	]
	
	newParagraph = get_node("../TextNew/RichTextLabel")
	_push_new_update()
	_update_paragraphs()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			# nach hinten blättern
			if event.button_index == BUTTON_WHEEL_UP:
				if current_position != 0:
					 current_position-=1
			# nach vorne blättern
			if event.button_index == BUTTON_WHEEL_DOWN:
				if current_position != len(pageTitles) - 1:
					 current_position+=1
	set_bbcode(pageTitles[current_position])
	_update_paragraphs()

func _update_paragraphs():
	var start_index = current_position * (numberSeparators - 1)
	var end_index = start_index + numberSeparators - 1
	for k in range(0, numberSeparators-1):
		texts[k].set_bbcode("")
	
	var j = 0
	for i in range(start_index, end_index):
		if i < len(paragraphs):
			texts[j].set_bbcode(paragraphs[i])
			j += 1
			
func _push_new_update():
	if len(new_paragraphs) > 0:
		newParagraph.set_bbcode(new_paragraphs.pop_front())
	else:
		newParagraph.set_bbcode(end_text)
		isEndText = true
