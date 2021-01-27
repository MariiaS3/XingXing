extends Control
var i=0;
var j=0;
var reward = 4
var question = 3
var t = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
var index = 0

var array = ["Wypisz 5 pierwszych liczb pierwszych",
"Wypisz liczby parzyste mniejsze od 13 binarnie liczac od 1",
"Dodaj do siebie dwie liczby binarne: 10111+11001",
"Odejmij dwie liczby binarne: 1011-101",
"Wypisz 7 pierwszych liczb z ciągu Fibonnaciego",
"Wypisz dlugosci stron trojkata tak, żeby byl to trojkat pitagorejski \n jedna strona, ktorego jest rowna 5",
"Wypisz dlugosci stron trojkata egipskiego",
"Jaka jest suma liczb na kole ruletki nazywana takze 'szatanska liczba'",
"Ile wynosi suma liczb od 1 do 100",
"Jaka liczba jest na 32 miejscu po przecinku w liczbie Pi",
"Ile razy w ciągu doby zachodza na siebie wskazowki godziny i minuty",
"Pan Blue mieszka w niebieskim domu, Pani Pink mieszka w rozowym domu, \n a Pan Brown w  domu brazowym. Kto mieszka w Bialym Domu?",
"Trzy pierwsze liczby doskonale",
"Litery A,B,C,D,E,F w systemie szesnastkowym to odpowiednio:",
"Kiedy tata Kuby miał 31 lat, Kuba miał 8 lat. Teraz wiek taty jest \n dokładnie dwa razy taki wiek Kuby. Ile lat ma obecnie Kuba?",
"Oblicz 5!+3!"] 
onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = $ColorRect
onready var label: Label = get_node("ColorRect/Label")

var paused: = false setget set_paused


func _ready() -> void:
# warning-ignore:return_value_discarded
	PlayerData.connect("quiz", self, "_on_quiz")



func _on_quiz() -> void:
	self.paused = true
	j = randi()%15+1
	if t[j]==0:
		t[j]=1
	label.text = array[j]


func _unhandled_input(_event: InputEvent) -> void:
	if i == 0:
		$ColorRect/AnimatedSprite.play("0")


func _on_Button_pressed():
	if i == 0:
		$ColorRect/AnimatedSprite.play("0")
	
	if j==0 &&  $ColorRect/TextEdit.text == "2,3,5,7,11":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==1 &&  $ColorRect/TextEdit.text == "10,100,110,1000,1100":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==2 &&  $ColorRect/TextEdit.text == "110000":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==3 &&  $ColorRect/TextEdit.text == "110":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==4 &&  $ColorRect/TextEdit.text == "0,1,1,2,3,5,8":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==5 &&  $ColorRect/TextEdit.text == "12,13":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==6 &&  $ColorRect/TextEdit.text == "3,4,5":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==7 &&  $ColorRect/TextEdit.text == "666":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==8 &&  $ColorRect/TextEdit.text == "5050":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==9 &&  $ColorRect/TextEdit.text == "0":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==10 &&  $ColorRect/TextEdit.text == "22":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==11 &&  $ColorRect/TextEdit.text == "Prezydent":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==12 &&  $ColorRect/TextEdit.text == "6,28,496":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==13 &&  $ColorRect/TextEdit.text == "10,11,12,13,14,15":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==14 &&  $ColorRect/TextEdit.text == "23":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	elif j==15 &&  $ColorRect/TextEdit.text == "126":
		question = question-1
		j = randi()%15+1
		while t[j]==1:
			j = randi()%15+1
		t[j]=1
		label.text = array[j]
	else:
		i = i+1
		if i==1:
			$ColorRect/AnimatedSprite.play("1")
		if i==2:
			$ColorRect/AnimatedSprite.play("2")
		if i==3:
			$ColorRect/AnimatedSprite.play("3")
			reward = reward -1
		if i==4:
			$ColorRect/AnimatedSprite.play("4")
		if i==5:
			$ColorRect/AnimatedSprite.play("5")
		if i==6:
			$ColorRect/AnimatedSprite.play("6")
			reward = reward-1
		if i==7:
			$ColorRect/AnimatedSprite.play("7")
		if i==8:
			$ColorRect/AnimatedSprite.play("8")
		if i==9:
			$ColorRect/AnimatedSprite.play("9")
			reward = reward - 1
		if i==10:
			$ColorRect/AnimatedSprite.play("10")
		if i==11:
			$ColorRect/AnimatedSprite.play("11")
			reward = reward-1
		label.text = array[j]
	if question==0:
		PlayerReward.index += reward
		PlayerReward.add_item(PlayerReward.index-reward)
		get_tree().paused= false
		self.paused = false
	elif i==12:
		i=0
		$ColorRect/AnimatedSprite.play("0")
		get_tree().paused= false
		self.paused = false
	


func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


