extends Control

var rndX 
var rndY

func _ready():
	if PlayGaram.garam > 0:
		$Garam/CollisionShape2D.disabled =true
		queue_free()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rndX = rng.randi_range(200, 50)
	var rndY = rng.randi_range(30, 30)
	$Garam.position = Vector2(rndX, rndY)
	$Timer.connect("timeout",self,"_on_Timer_timeout()")

func _on_Timer_timeout():
	$Garam.visible = !$Garam.visible
	_ready()

func _on_Garam_body_entered(body):
	PlayGaram.garam+=1

