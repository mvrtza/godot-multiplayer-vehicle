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



func _on_restart_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_ip_text_changed():
	var server = globalserver
	server.ip = $ip_chenger/server/ip.text
	pass # Replace with function body.


func _on_port_text_changed():
	var server = globalserver
	server.ip = $ip_chenger/server/ip.text
	pass # Replace with function body.
