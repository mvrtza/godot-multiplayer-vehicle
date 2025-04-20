extends Area3D

var car_body:RigidBody3D
var gas_pump = false
func _on_body_entered(body):
	if("maximum_gas" in body):
		car_body = body
		get_parent().get_node('gas_control/start').visible = true
func _on_body_exited(body):
	if("maximum_gas" in body):
		car_body = null
		get_parent().get_node('gas_control/start').visible = false
		get_parent().get_node('gas_control/stop').visible = false

func _physics_process(delta):
	if(car_body):
		if("maximum_gas" in car_body):
			if(car_body.avaliable_gas <= car_body.maximum_gas && gas_pump):
				car_body.stop_car = true
				car_body.freeze = true
				car_body.avaliable_gas += 0.01
			else:
				car_body.stop_car = false
				car_body.freeze = false




func _on_start_pressed():
	if(!gas_pump):
		gas_pump = true
		get_parent().get_node('gas_control/stop').visible = true
		get_parent().get_node('gas_control/start').visible = false
	else:
		gas_pump = false
		get_parent().get_node('gas_control/start').visible = true
		get_parent().get_node('gas_control/stop').visible = false
	pass # Replace with function body.


func _on_stop_pressed():
	if(gas_pump):
		gas_pump = false
		get_parent().get_node('gas_control/start').visible = true
		get_parent().get_node('gas_control/stop').visible = false
	else:
		gas_pump = true
		get_parent().get_node('gas_control/stop').visible = true
		get_parent().get_node('gas_control/start').visible = false
	pass # Replace with function body.
