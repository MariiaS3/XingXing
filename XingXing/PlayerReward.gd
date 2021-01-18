extends Node2D

const NUM_INVENTORY_SLOTS = 21


var index =0
var start =0

var dane = ["1.","2.","3.","4.","5.","6.","13.","14.","16.","17.","18.","25.","26.","27.","29.","30.","37.","38.","41.","42."]

var inventory = {
	
}

func add_item(item):
	# item doesn't exist in inventory yet, so add it to an empty slot
	for i in range(NUM_INVENTORY_SLOTS):
		if item == index:
			return
		elif inventory.has(i) == false:
			inventory[i] = [dane[item]]
			item = item+1
		
