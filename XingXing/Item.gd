extends Node2D

var item_name

func set_item(nm):
	item_name = nm
	$TextureRect.texture = load("res://flowers/" + item_name + "png")


