extends RichTextLabel

var numberSeparators = 4

var pageTitles = [
	"[b][u]Page 1[/u][/b]",
	"[b][u]Page 2[/u][/b]",
	"[b][u]Page 3[/u][/b]",
	"[b][u]Page 4[/u][/b]",
	"[b][u]Page 5[/u][/b]",
	"[b][u]Page 6[/u][/b]",
	"[b][u]Page 7[/u][/b]",
	"[b][u]Page 8[/u][/b]",
	"[b][u]Page 9[/u][/b]",
	"[b][u]Page 10[/u][/b]",
]

var monday = "[b][u]Monday – the crime scene[/u][/b] \nI first arrived at the crime scene around half past 9 pm. The sirens of the nearby police cars were periodically bathing the nearby park in blue light when the officer saw me and approached me slowly. Behind him, I saw a body on the ground."
var tuesday = "[b][u]Tuesday – White[/u][/b] \nI filed away an old case, the murder of a young boy, that I had solved with flying colours. My boss even went to the trouble of stopping by to congratulate me. She can be harsh sometimes, but I felt as if she was really proud. The day was mostly boring, but one thing…"
var wednesday = "[b][u]Wednesday – autopsy report[/u][/b] \nTo my surprise, the autopsy was handed into my office in record time, just two days after the incident. It stated the cause and the time of death. A gun wound was on his right hip, and another one in his chest, he died from the second shot."
var thursday = "[b][u]Thursday – Red’s interrogation[/u][/b] \nTodays interrogation was a pain. Red, White’s father is the only person that can both be depressed and smug at the same time. He claimed to be on the B34 during the incident, only being informed by telephone when he arrived home."
var friday = "[b][u]Friday – Blue’s interrogation[/u][/b] \nBlue is Reds wife. She told me she was walking through the park after visiting a bar with a friend when she heard a scream and a gunshot. When I asked about the friend further, she assured it was just a friend."
var saturday = "[b][u]Saturday – Amber’s interrogation[/u][/b] \nAmber is the friend that was with Blue. They visited the bar and walked through the park afterwards, she backed her “best friend” (her words). When the bang and the scream were audible, she said, she told Blue to call for help, and ran towards the sound."
var sunday = "[b][u]Sunday – Coming together[/u][/b] \nToday, Blue showed up voluntarily. She wanted to report her husband to the police on suspicion of murder. I had to inform her that we couldn’t detain him without evidence, so she gave me a photo of him in a Jazz bar. It wasn’t evidence, but a strong clue, so I sent a unit to get him to the police station."

var paragraphs = [
	monday,
	tuesday,
	wednesday,
	thursday,
	friday,
	saturday,
	sunday
]

var illustrations

var new_paragraphs = [
	"When I asked what had happened, he told me about a panicking caller, who sobbed about a gunshot and a man crying for help. He then took me to the victim. Around the police cordon, the first journalists arrived, and the flash of a camera hurt my eyes.",
]

var randomParagraphs = [
	"The body itself was face down on the asphalt, in a small pool of blood. The officer told me his name was White, and that he was the child of a well known businessman. I already dread to have to deal with him.",
	"The new intel was an important fact about my new case. Apparently, White was a known underground jazz musician in the area, working under the pseudonym White Bexxie, gigging in bars downtown.",
	"That was also a main conflict point with his father, a serious man, who had already planned out the future of his son where he would have gone to a renowned business school, taking over his economic empire as soon as he’d be returning home.",
	"He died from the second shot. This happened pretty exactly at 9 o’clock. I also got affirmation about potential culprits in the case: I had three suspects. White’s father, his father's new wife, and a friend of her, who she was seen with earlier that night. ",
	"The first suspect I have to speak to would be the father, a famous businessman. I’ll do that tomorrow, so it’s over as quickly as possible. If this case goes by cliché, the father killed his son because of his passion for jazz.",
	"He left again immediately and went to the crime scene as fast as possible but arrived only when police were already cleaning up. His wife met him there at the park, absolutely in tears about the death of their son, and they went home immediately afterwards.",
	"Although his story seems believable, he recounted the death of his only child very stoic, leaving me unsure of his true feelings. Other details added up, but a highway drive is usually not eventful. When talking about his son’s passion, he dodged every question, even outright refusing to answer.",
	"But she is not good at lying, and it was clear she was involved in something. She claims to have phoned the police from the nearby payphone, and I was later reassured her voice and the voice of the 911 call matched. The call was sent at 8:56 pm.",
	"She didn’t seem to know about White’s Jazz-alter ego, asking if Red might have known of this before the incident. She seems to suspect him, stating that she would stay with a friend nearby for the night.",
	"Surprisingly, she told me about seeing Red in a bar downtown. He was supposedly with a female companion but when she wanted to direct Blues attention to him, he was already gone. They then talked about Blue and Red’s relationship on their way through the park.",
	"She seems to be unhappy with the current situation but couldn’t persuade her “best friend” so far. This is only speculation though, when asked about her feelings towards Blue she laughed and asked how I could think of her as someone who’d be an affair.",
	"Amber was with him, when he was brought. Blue asked about the meaning of this, but Red angrily pushed Amber away, and declared she was waiting in front of the building. She denied, and told she was spying on Blue to find out if he really was having an affair as she suspected.",
	"She couldn’t find any more evidence to support her claim but seemed sure about its truth regardless. With the appearance of Red and Amber, Blues behaviour changed dramatically, being angry and accusatory before, she figuratively curled up to a ball and avoided any eye contact.",
	"So, I had them brought in another room for a moment, questioning only my initial guest again. She confessed to having been influenced by Amber in her decision to report her husband to the officials. At this point, she seems to be only a puppet to both Amber and Red.",
	"When they returned, I confronted Red with the evidence. He was enraged about the existence of the picture but did not deny it. But he said there were witnesses who were there with him, and it happened like a month ago. Therefore, it did not disprove his story.",
	"Amber disagreed. She said she was sure the picture was taken yesterday, and they should ask said witnesses. I asked Red if he was okay with that, and he answered, that he was indeed. Repelled by the confident answer, Amber looked at Blue helplessly.",
	"The woman, sitting in the corner just a minute ago, was now standing, breathing heavily. “I am sure, you were there on Monday too, you’re there every Monday!” She tried to lash out at Red, but he dodged back, and a policeman entered, and retained the enraged woman. ",
	" “Ever since I knew you were cheating, I wanted to get revenge, so here’s what I did. I destroyed your son, I destroyed your dreams!”, she suddenly nagged. “You were supposed to be there on Monday again, everything would have worked! I had even called police earlier, used your revolver.”",
	"She didn’t stop, ignoring the policeman’s grip on her. “I prepared everything, but you just destroyed it by not going to the pub like you always did! I will get you for this. I will destroy everything you have ever loved!” I had to have the policeman to take her away, leaving me with Red and Amber.",
	"They both looked at each other in a mix of confusion and disgust. When the first shock passed, they stood up and walked out of the door together. I feel like, although the cruel circumstances, they found a partner for life. "
]

var correct_solution = [
	"[b][u]Monday – the crime scene[/u][/b] \nI first arrived at the crime scene around half past 9 pm. The sirens of the nearby police cars were periodically bathing the nearby park in blue light when the officer saw me and approached me slowly. Behind him, I saw a body on the ground.",
	"When I asked what had happened, he told me about a panicking caller, who sobbed about a gunshot and a man crying for help. He then took me to the victim. Around the police cordon, the first journalists arrived, and the flash of a camera hurt my eyes.",
	"The body itself was face down on the asphalt, in a small pool of blood. The officer told me his name was White, and that he was the child of a well known businessman. I already dread to have to deal with him.",
	"[b][u]Tuesday – White[/u][/b] \nI filed away an old case, the murder of a young boy, that I had solved with flying colours. My boss even went to the trouble of stopping by to congratulate me. She can be harsh sometimes, but I felt as if she was really proud. The day was mostly boring, but one thing…",
	"The new intel was an important fact about my new case. Apparently, White was a known underground jazz musician in the area, working under the pseudonym White Bexxie, gigging in bars downtown.",
	"That was also a main conflict point with his father, a serious man, who had already planned out the future of his son where he would have gone to a renowned business school, taking over his economic empire as soon as he’d be returning home.",
	"[b][u]Wednesday – autopsy report[/u][/b] \nTo my surprise, the autopsy was handed into my office in record time, just two days after the incident. It stated the cause and the time of death. A gun wound was on his right hip, and another one in his chest, he died from the second shot.",
	"He died from the second shot. This happened pretty exactly at 9 o’clock. I also got affirmation about potential culprits in the case: I had three suspects. White’s father, his father's new wife, and a friend of her, who she was seen with earlier that night. ",
	"The first suspect I have to speak to would be the father, a famous businessman. I’ll do that tomorrow, so it’s over as quickly as possible. If this case goes by cliché, the father killed his son because of his passion for jazz.",
	"[b][u]Thursday – Red’s interrogation[/u][/b] \nTodays interrogation was a pain. Red, White’s father is the only person that can both be depressed and smug at the same time. He claimed to be on the B34 during the incident, only being informed by telephone when he arrived home.",
	"He left again immediately and went to the crime scene as fast as possible but arrived only when police were already cleaning up. His wife met him there at the park, absolutely in tears about the death of their son, and they went home immediately afterwards.",
	"Although his story seems believable, he recounted the death of his only child very stoic, leaving me unsure of his true feelings. Other details added up, but a highway drive is usually not eventful. When talking about his son’s passion, he dodged every question, even outright refusing to answer.",
	"[b][u]Friday – Blue’s interrogation[/u][/b] \nBlue is Reds wife. She told me she was walking through the park after visiting a bar with a friend when she heard a scream and a gunshot. When I asked about the friend further, she assured it was just a friend.",
	"But she is not good at lying, and it was clear she was involved in something. She claims to have phoned the police from the nearby payphone, and I was later reassured her voice and the voice of the 911 call matched. The call was sent at 8:56 pm.",
	"She didn’t seem to know about White’s Jazz-alter ego, asking if Red might have known of this before the incident. She seems to suspect him, stating that she would stay with a friend nearby for the night.",
	"[b][u]Saturday – Amber’s interrogation[/u][/b] \nAmber is the friend that was with Blue. They visited the bar and walked through the park afterwards, she backed her “best friend” (her words). When the bang and the scream were audible, she said, she told Blue to call for help, and ran towards the sound.",
	"Surprisingly, she told me about seeing Red in a bar downtown. He was supposedly with a female companion but when she wanted to direct Blues attention to him, he was already gone. They then talked about Blue and Red’s relationship on their way through the park.",
	"She seems to be unhappy with the current situation but couldn’t persuade her “best friend” so far. This is only speculation though, when asked about her feelings towards Blue she laughed and asked how I could think of her as someone who’d be an affair.",
	"[b][u]Sunday – Coming together[/u][/b] \nToday, Blue showed up voluntarily. She wanted to report her husband to the police on suspicion of murder. I had to inform her that we couldn’t detain him without evidence, so she gave me a photo of him in a Jazz bar. It wasn’t evidence, but a strong clue, so I sent a unit to get him to the police station.",
	"Amber was with him, when he was brought. Blue asked about the meaning of this, but Red angrily pushed Amber away, and declared she was waiting in front of the building. She denied, and told she was spying on Blue to find out if he really was having an affair as she suspected.",
	"She couldn’t find any more evidence to support her claim but seemed sure about its truth regardless. With the appearance of Red and Amber, Blues behaviour changed dramatically, being angry and accusatory before, she figuratively curled up to a ball and avoided any eye contact.",
	"So, I had them brought in another room for a moment, questioning only my initial guest again. She confessed to having been influenced by Amber in her decision to report her husband to the officials. At this point, she seems to be only a puppet to both Amber and Red.",
	"When they returned, I confronted Red with the evidence. He was enraged about the existence of the picture but did not deny it. But he said there were witnesses who were there with him, and it happened like a month ago. Therefore, it did not disprove his story.",
	"Amber disagreed. She said she was sure the picture was taken yesterday, and they should ask said witnesses. I asked Red if he was okay with that, and he answered, that he was indeed. Repelled by the confident answer, Amber looked at Blue helplessly.",
	"The woman, sitting in the corner just a minute ago, was now standing, breathing heavily. “I am sure, you were there on Monday too, you’re there every Monday!” She tried to lash out at Red, but he dodged back, and a policeman entered, and retained the enraged woman. ",
	" “Ever since I knew you were cheating, I wanted to get revenge, so here’s what I did. I destroyed your son, I destroyed your dreams!”, she suddenly nagged. “You were supposed to be there on Monday again, everything would have worked! I had even called police earlier, used your revolver.”",
	"She didn’t stop, ignoring the policeman’s grip on her. “I prepared everything, but you just destroyed it by not going to the pub like you always did! I will get you for this. I will destroy everything you have ever loved!” I had to have the policeman to take her away, leaving me with Red and Amber.",
	"They both looked at each other in a mix of confusion and disgust. When the first shock passed, they stood up and walked out of the door together. I feel like, although the cruel circumstances, they found a partner for life. "
]

var solution1 = [
	"[b][u]Monday – the crime scene[/u][/b] \nI first arrived at the crime scene around half past 9 pm. The sirens of the nearby police cars were periodically bathing the nearby park in blue light when the officer saw me and approached me slowly. Behind him, I saw a body on the ground.",
	"When I asked what had happened, he told me about a panicking caller, who sobbed about a gunshot and a man crying for help. He then took me to the victim. Around the police cordon, the first journalists arrived, and the flash of a camera hurt my eyes.",
	"The body itself was face down on the asphalt, in a small pool of blood. The officer told me his name was White, and that he was the child of a well known businessman. I already dread to have to deal with him."
]

var solution2= [
	"[b][u]Tuesday – White[/u][/b] \nI filed away an old case, the murder of a young boy, that I had solved with flying colours. My boss even went to the trouble of stopping by to congratulate me. She can be harsh sometimes, but I felt as if she was really proud. The day was mostly boring, but one thing…",
	"The new intel was an important fact about my new case. Apparently, White was a known underground jazz musician in the area, working under the pseudonym White Bexxie, gigging in bars downtown.",
	"That was also a main conflict point with his father, a serious man, who had already planned out the future of his son where he would have gone to a renowned business school, taking over his economic empire as soon as he’d be returning home."
]

var solution3 = [
	"[b][u]Wednesday – autopsy report[/u][/b] \nTo my surprise, the autopsy was handed into my office in record time, just two days after the incident. It stated the cause and the time of death. A gun wound was on his right hip, and another one in his chest, he died from the second shot.",
	"He died from the second shot. This happened pretty exactly at 9 o’clock. I also got affirmation about potential culprits in the case: I had three suspects. White’s father, his father's new wife, and a friend of her, who she was seen with earlier that night. ",
	"The first suspect I have to speak to would be the father, a famous businessman. I’ll do that tomorrow, so it’s over as quickly as possible. If this case goes by cliché, the father killed his son because of his passion for jazz.",
]

var solution4 = ["[b][u]Thursday – Red’s interrogation[/u][/b] \nTodays interrogation was a pain. Red, White’s father is the only person that can both be depressed and smug at the same time. He claimed to be on the B34 during the incident, only being informed by telephone when he arrived home.",
	"He left again immediately and went to the crime scene as fast as possible but arrived only when police were already cleaning up. His wife met him there at the park, absolutely in tears about the death of their son, and they went home immediately afterwards.",
	"Although his story seems believable, he recounted the death of his only child very stoic, leaving me unsure of his true feelings. Other details added up, but a highway drive is usually not eventful. When talking about his son’s passion, he dodged every question, even outright refusing to answer."
]

var solution5 = [
	"[b][u]Friday – Blue’s interrogation[/u][/b] \nBlue is Reds wife. She told me she was walking through the park after visiting a bar with a friend when she heard a scream and a gunshot. When I asked about the friend further, she assured it was just a friend.",
	"But she is not good at lying, and it was clear she was involved in something. She claims to have phoned the police from the nearby payphone, and I was later reassured her voice and the voice of the 911 call matched. The call was sent at 8:56 pm.",
	"She didn’t seem to know about White’s Jazz-alter ego, asking if Red might have known of this before the incident. She seems to suspect him, stating that she would stay with a friend nearby for the night.",
]

var solution6 = [
	"[b][u]Saturday – Amber’s interrogation[/u][/b] \nAmber is the friend that was with Blue. They visited the bar and walked through the park afterwards, she backed her “best friend” (her words). When the bang and the scream were audible, she said, she told Blue to call for help, and ran towards the sound.",
	"Surprisingly, she told me about seeing Red in a bar downtown. He was supposedly with a female companion but when she wanted to direct Blues attention to him, he was already gone. They then talked about Blue and Red’s relationship on their way through the park.",
	"She seems to be unhappy with the current situation but couldn’t persuade her “best friend” so far. This is only speculation though, when asked about her feelings towards Blue she laughed and asked how I could think of her as someone who’d be an affair.",
]

var solution7 = [
	"[b][u]Sunday – Coming together[/u][/b] \nToday, Blue showed up voluntarily. She wanted to report her husband to the police on suspicion of murder. I had to inform her that we couldn’t detain him without evidence, so she gave me a photo of him in a Jazz bar. It wasn’t evidence, but a strong clue, so I sent a unit to get him to the police station.",
	"Amber was with him, when he was brought. Blue asked about the meaning of this, but Red angrily pushed Amber away, and declared she was waiting in front of the building. She denied, and told she was spying on Blue to find out if he really was having an affair as she suspected.",
	"She couldn’t find any more evidence to support her claim but seemed sure about its truth regardless. With the appearance of Red and Amber, Blues behaviour changed dramatically, being angry and accusatory before, she figuratively curled up to a ball and avoided any eye contact.",
	"So, I had them brought in another room for a moment, questioning only my initial guest again. She confessed to having been influenced by Amber in her decision to report her husband to the officials. At this point, she seems to be only a puppet to both Amber and Red.",
	"When they returned, I confronted Red with the evidence. He was enraged about the existence of the picture but did not deny it. But he said there were witnesses who were there with him, and it happened like a month ago. Therefore, it did not disprove his story.",
	"Amber disagreed. She said she was sure the picture was taken yesterday, and they should ask said witnesses. I asked Red if he was okay with that, and he answered, that he was indeed. Repelled by the confident answer, Amber looked at Blue helplessly.",
	"The woman, sitting in the corner just a minute ago, was now standing, breathing heavily. “I am sure, you were there on Monday too, you’re there every Monday!” She tried to lash out at Red, but he dodged back, and a policeman entered, and retained the enraged woman. ",
	" “Ever since I knew you were cheating, I wanted to get revenge, so here’s what I did. I destroyed your son, I destroyed your dreams!”, she suddenly nagged. “You were supposed to be there on Monday again, everything would have worked! I had even called police earlier, used your revolver.”",
	"She didn’t stop, ignoring the policeman’s grip on her. “I prepared everything, but you just destroyed it by not going to the pub like you always did! I will get you for this. I will destroy everything you have ever loved!” I had to have the policeman to take her away, leaving me with Red and Amber.",
	"They both looked at each other in a mix of confusion and disgust. When the first shock passed, they stood up and walked out of the door together. I feel like, although the cruel circumstances, they found a partner for life. "
]
var texts

var end_text = "You now have all parts of the story. Click here if you think you have figured out the correct order!"

var current_position = 0

var newParagraph

var isEndText = false

var player

var document

var background : Sprite

func _ready():
	texts = [
		get_node("../Text1/RichTextLabel"),
		get_node("../Text2/RichTextLabel"),
		get_node("../Text3/RichTextLabel")
	]
	
	illustrations = [
		preload("res://MONDAY.png"),
		preload("res://TUESDAY.png"),
		preload("res://TUESDAY.png"),
		preload("res://THURSDAY.png"),
		preload("res://FRIDAY.png"),
		preload("res://SATURDAY.png"),
		preload("res://SUNDAY.png"),
	]
	
	randomize()
	randomParagraphs.shuffle()
	new_paragraphs = new_paragraphs + randomParagraphs
	
	newParagraph = get_node("../TextNew/RichTextLabel")
	_push_new_update()
	_update_paragraphs()

func _process(delta):
	background = get_node("../../SATURDAY")
	background.visible=true
	for paragraph in paragraphs:
		if _check_day(monday, solution1):
			background.set_texture(illustrations[0])
		elif _check_day(tuesday, solution2):
			background.set_texture(illustrations[1])
		elif _check_day(wednesday, solution3):
			background.set_texture(illustrations[2])
		elif _check_day(thursday, solution4):
			background.set_texture(illustrations[3])
		elif _check_day(friday, solution5):
			background.set_texture(illustrations[4])
		elif _check_day(saturday, solution6):
			background.set_texture(illustrations[5])
		elif _check_day(sunday, solution7):
			background.set_texture(illustrations[6])
		else:
			background.visible=false
		
		
func _check_day(day, solution):
	var collect_solution = false
	var possible_solution = []
	var i=0
	for paragraph in paragraphs:
		if i == len(solution):
			continue
		if paragraph == day:
			collect_solution=true
		if collect_solution:
			i+=1
			possible_solution.append(paragraph)
	return possible_solution == solution
	

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			# nach hinten blättern
			if event.button_index == BUTTON_WHEEL_UP:
				if current_position != 0:
					 current_position-=1
					 get_node("../../turning").play()
					 var document = get_node("../document/AnimationPlayer")
					 document.play("pageTurningDown")
			# nach vorne blättern
			if event.button_index == BUTTON_WHEEL_DOWN:
				if current_position != len(pageTitles) - 1:
					 current_position+=1
					 get_node("../../turning").play()
					 var document = get_node("../document/AnimationPlayer")
					 document.play("pageTurningDown")
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
