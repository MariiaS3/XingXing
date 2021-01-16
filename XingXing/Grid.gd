extends Control


var rndX 
var rndY

func _ready():
	if PlayerData.quize > 0:
		$Wiesielec/CollisionShape2D.disabled =true
		queue_free()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var rndX = rng.randi_range(300, 50)
	var rndY = rng.randi_range(50, 50)
	$Wiesielec.position = Vector2(rndX, rndY)
	$Timer.connect("timeout",self,"_on_Timer_timeout()")

func _on_Timer_timeout():
	$Wiesielec.visible = !$Wiesielec.visible
	_ready()


func _on_Wiesielec_body_entered(body):
	PlayerData.quize+=1
	
