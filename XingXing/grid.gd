extends Control

var PauseTime = Timer.new()
var rndX 
var rndY

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	rndX = rng.randi_range(200, 50)
	rndY = rng.randi_range(30, 30)
	$Sudoku.position = Vector2(rndX, rndY)
	PauseTime.connect("timeout",$Sudoku,"_on_Timer_timeout()")

func _on_Timer_timeout():
	$Sudoku.visible = !$Sudoku.visible
	if PlayerData.sudok > 0:
		$Sudoku/CollisionShape2D.disabled =true
		queue_free()

func _on_Wiesielec_body_entered(_body):
	PlayerData.sudok+=1
