extends Control
var i=0;

onready var scene_tree: SceneTree = get_tree()
onready var pause_overlay: ColorRect = $ColorRect


var paused: = false setget set_paused


func _ready() -> void:
	PlayerData.connect("died", self, "_on_Player_died")



func _on_Player_died() -> void:
	self.paused = true


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not self.paused


func _on_Button_pressed():
	if i == 0:
		$ColorRect/AnimatedSprite.play("0")
		
	if $ColorRect/TextEdit.text == "5":
		get_node("ColorRect/Label").set_text("55555555555")
	else:
		i = i+1
		if i==1:
			$ColorRect/AnimatedSprite.play("1")
		if i==2:
			$ColorRect/AnimatedSprite.play("2")
		if i==3:
			$ColorRect/AnimatedSprite.play("3")
		if i==4:
			$ColorRect/AnimatedSprite.play("4")
		if i==5:
			$ColorRect/AnimatedSprite.play("5")
		if i==6:
			$ColorRect/AnimatedSprite.play("6")
		if i==7:
			$ColorRect/AnimatedSprite.play("7")
		if i==8:
			$ColorRect/AnimatedSprite.play("8")
		if i==9:
			$ColorRect/AnimatedSprite.play("9")
		if i==10:
			$ColorRect/AnimatedSprite.play("10")
		if i==11:
			$ColorRect/AnimatedSprite.play("11")
		get_node("ColorRect/Label").set_text("nooooooooo")
		

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
