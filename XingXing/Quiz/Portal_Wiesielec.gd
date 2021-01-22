extends Control

var PauseTime = Timer.new()
var rndX 
var rndY

func _ready():
	PauseTime.connect("timeout",self,"_on_Timer_timeout")

func _on_Timer_timeout():
	$Wiesielec.visible = !$Wiesielec.visible
	if PlayerData.quize > 0:
		$Wiesielec/CollisionShape2D.disabled =true
		queue_free()

func _on_Wiesielec_body_entered(_body):
	PlayerData.quize+=1
