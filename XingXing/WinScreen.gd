extends Control

onready var enemies: Label = get_node("Label2")
onready var coins: Label = get_node("Label3")

func _ready():
	enemies.text =  "You have killed  %s   enemies in this level" % Global.enemy
	Global.enemy = 0
	coins.text = "You collected  %s  coins in this level" % Global.coins
	Global.coins =0
