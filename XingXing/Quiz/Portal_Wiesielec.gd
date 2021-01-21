extends Control

var PauseTime = Timer.new()
var rndX 
var rndY

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	rndX = rng.randi_range(400, 50)
	rndY = rng.randi_range(30, 30)
	$Wiesielec.position = Vector2(rndX, rndY)
	PauseTime.connect("timeout",self,"_on_Timer_timeout")

func _on_Timer_timeout():
	$Wiesielec.visible = !$Wiesielec.visible
	if PlayerData.quize > 0:
		$Wiesielec/CollisionShape2D.disabled =true
		queue_free()
	_ready()

func _on_Wiesielec_body_entered(_body):
	PlayerData.quize+=1
