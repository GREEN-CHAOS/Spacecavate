extends Tabs

# should be used to emit signals
signal time_changed(time)
signal height_changed(height)
signal velocity_changed(velocity)
signal deltav_changed(deltav)
signal fuel_percentage_changed(fuel_percentage)
signal transfer_new(transfer_name)
signal transfer_property_changed(transfer_name, property, new_value)
signal stage_new(stage_name)
signal stage_property_changed(stage_name, property, new_value)
signal t_mission_changed(time)


# Called when the node enters the scene tree for the first time.
func _ready(): #debug
	print("timeout")
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("stage_new","test_stage")
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("stage_new","test_stage2")
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("stage_new","test_stage3")
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("transfer_new","test_transfer")
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("transfer_new","test_transfer2")
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("transfer_new","test_transfer3")
	print("emitted signals")


func reconnect_singals():
	var rockets = get_tree().get_nodes_in_group("Rockets_selected")
	if rockets.size() > 1:
		return # not supported currently
	var rocket = rockets[0] as Rocket
	rocket.connect("time_changed", self, "time_changed")
	rocket.connect("height_changed", self, "height_changed")
	rocket.connect("velocity_changed", self, "velocity_changed")
	rocket.connect("deltav_changed", self, "deltav_changed")
	rocket.connect("fuel_percentage_changed", self, "fuel_percentage_changed")
	rocket.connect("stage_property_changed", self, "stage_property_changed")
	# wont be connected to the rocket
	#rocket.connect("transfer_new", self, "transfer_new")
	#rocket.connect("transfer_property_changed", self, "transfer_property_changed")
	#rocket.connect("stage_new", self, "stage_new")
	#rocket.connect("t_mission_changed", self, "t_mission_changed")

# not using rocket here as this UI only supports one Rocket at a time
func time_changed(rocket, time):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("time_changed", time)

func height_changed(rocket, height):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("height_changed", height)

func velocity_changed(rocket, velocity):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("velocity_changed", velocity)

func deltav_changed(rocket, deltav):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("deltav_changed", deltav)

func fuel_percentage_changed(rocket, fuel_percentage):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("fuel_percentage_changed", fuel_percentage)

func transfer_new(rocket, transfer_name):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("transfer_new", transfer_name)

func transfer_property_changed(rocket, transfer_name ,property , new_value):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("transfer_property_changed", transfer_name, property, new_value)

func stage_new(rocket, stage_name):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("stage_new",stage_name)

func stage_property_changed(rocket, stage_name, property, new_value):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("stage_property_changed", stage_name, property, new_value)

func t_mission_changed(rocket, time):
	if rocket.is_in_group("Rocket_selected"):
		emit_signal("t_mission_changed", time)
