extends StaticBody3D


func _on_gas_station_area_body_entered(body):
	if("maximum_gas" in body):
		body.avaliable_gas = body.maximum_gas
	pass # Replace with function body.
