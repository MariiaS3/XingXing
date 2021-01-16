extends Control


var rndX 
var rndY

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rndX = rng.randi_range(200, 50)
	var rndY = rng.randi_range(30, 30)
	$Wiesielec.position = Vector2(rndX, rndY)
	$Timer.connect("timeout",self,"_on_Timer_timeout()")

func _on_Timer_timeout():
	$Wiesielec.visible = !$Wiesielec.visible
	_ready()


func _on_Wiesielec_body_entered(body):
	Global.quiz+=1
