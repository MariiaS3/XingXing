extends Control

var PauseTime = Timer.new()
var rndX 
var rndY

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	rndX = rng.randi_range(200, 50)
	rndY = rng.randi_range(30, 30)
	$Garam.position = Vector2(rndX, rndY)
	PauseTime.connect("timeout",$Garam,"_on_Timer_timeout()")

func _on_Timer_timeout():
	$Garam.visible = !$Garam.visible
	if PlayerData.garam > 0:
		$Garam/CollisionShape2D.disabled =true
		queue_free()

func _on_Garam_body_entered(_body):
	PlayerData.garam+=1

