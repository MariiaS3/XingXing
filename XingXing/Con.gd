extends Control


var rndX 
var rndY

func _ready():
	#var size = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rndX = rng.randi_range(300, 50)
	var rndY = rng.randi_range(50, 50)
	$Wiesielec.position = Vector2(rndX, rndY)
	$Timer.connect("timeout",self,"_on_Timer_timeout()")

func _on_Timer_timeout():
	$Wiesielec.visible = !$Wiesielec.visible
	_ready()

