extends Control

var PauseTime = Timer.new()
var rndX 
var rndY

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	rndX = rng.randi_range(500, 50)
	rndY = rng.randi_range(40, 40)
	$Sudoku.position = Vector2(rndX, rndY)
	PauseTime.connect("timeout",self,"_on_Timer_timeout")

func _on_Timer_timeout():
	$Sudoku.visible = !$Sudoku.visible
	if PlayerData.sudok > 0:
		$Sudoku/CollisionShape2D.disabled =true
		queue_free()
	_ready()

func _on_Sudoku_body_entered(body):
	PlayerData.sudok+=1
