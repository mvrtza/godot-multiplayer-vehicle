extends Node2D

func _enter_tree():
	match OS.get_name():
		"Android":
			visible = true
@export var base_resolution = Vector2(1024,600)
