extends Node2D

onready var inventory_slots = $GridContainer

#func _ready():
#	var slots = inventory_slots.get_children()
#	initialize_inventory()

func initialize_inventory():
	var slots = inventory_slots.get_children()
	for i in range(slots.size()):
		if PlayerReward.inventory.has(i):
			slots[i].initialize_item(PlayerReward.inventory[i][0])
			

