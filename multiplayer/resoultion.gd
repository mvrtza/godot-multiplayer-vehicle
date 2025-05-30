extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_d_value_changed(value):
	get_viewport().scaling_3d_scale = value;
	pass # Replace with function body.


func _on_sharpness_value_changed(value):
	get_viewport().fsr_sharpness = value;
	pass # Replace with function body.
