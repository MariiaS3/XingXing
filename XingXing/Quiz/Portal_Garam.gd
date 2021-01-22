extends Control

var PauseTime = Timer.new()
var rndX 
var rndY

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	rndX = rng.randi_range(400, 50)
	rndY = rng.randi_range(30, 30)
	$Garam.position = Vector2(rndX, rndY)
	PauseTime.connect("timeout",self,"_on_Timer_timeout")

func _on_Timer_timeout():
	$Garam.visible = !$Garam.visible
	if PlayerData.garam > 0:
		$Garam/CollisionShape2D.disabled =true
		queue_free()
	_ready()

func _on_Garam_body_entered(body):
	PlayerData.garam+=1
