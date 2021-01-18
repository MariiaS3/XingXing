extends Panel

var ItemClass = preload("res://Item.tscn")
var item = null


func add_item():
	if randi() % 2 == 0:
		item = ItemClass.instance()
		add_child(item)

func initialize_item(item_name):
	if item == null:
		item = ItemClass.instance()
		add_child(item)
		item.set_item(item_name)
	else:
		item.set_item(item_name)
	

